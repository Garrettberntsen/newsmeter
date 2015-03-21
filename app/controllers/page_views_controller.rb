class PageViewsController < ApplicationController

	layout false

	protect_from_forgery except: :send_page

	def send_page

		if request.get?
			render :nothing => true, :status => 204 and return
		end

		if params.has_key?(:url) == false
			update_page_view = PageView.find(params[:page_view_id].to_i)
			update_page_view.ended_at = DateTime.now
			update_page_view.save
			render :nothing => true, :status => 204 and return
		end

		begin
			whitelist = Site.all
			is_whitelisted = false
			site_id = nil
			whitelist.each do |x|
				if (URI.parse(params[:url]).host.downcase.include? ("." + x.domain)) || (URI.parse(params[:url]).host.downcase.include? ("://" + x.domain)) || (URI.parse(params[:url]).host.downcase == x.domain)
					is_whitelisted = true
					site_id = x.id
					break
				end
			end
			render :nothing => true, :status => 204 and return if is_whitelisted == false
			new_page_view = nil
			if Page.select(:canonical_url).pluck(:canonical_url).include? params[:canonicalurl]
				new_page_view = PageView.new :user_id => 1, :actual_url => (params[:url] == "" ? nil : params[:url]), :page_id => (Page.find_by canonical_url: params[:canonicalurl]).id, :ip_address => request.remote_ip
				new_page_view.save
			else
				new_page = Page.new :canonical_url => params[:canonicalurl], :title => (params[:canonicaltitle] == "" ? nil: params[:canonicaltitle]), :page_type => (params[:ogtype] == "" ? nil: params[:ogtype]), :author => (params[:author] == "" ? nil: params[:author]), :description => (params[:description] == "" ? nil: params[:description]), :site_id => site_id 
				new_page.save
				new_page_view = PageView.new :user_id => 1, :actual_url => (params[:url] == "" ? nil : params[:url]), :page_id => (Page.find_by canonical_url: params[:canonicalurl]).id, :ip_address => request.remote_ip
				new_page_view.save

				unless params[:keywords] == ""
					keyword_array = params[:keywords].split(",").uniq
					keyword_array.each do |x|
						y = x.strip
						if Keyword.where("lower(keyword) = ?", y.downcase).count == 0
							new_kw = Keyword.new :keyword => y
							new_kw.save
							new_pg_kw = PageKeyword.new :page_id => new_page_view.page_id, :keyword_id => new_kw.id
							new_pg_kw.save
						else
							new_pg_kw = PageKeyword.new :page_id => new_page_view.page_id, :keyword_id => Keyword.where("lower(keyword) = ?", y.downcase).first.id
							new_pg_kw.save
						end
					end
				end

			end

			# response.headers.delete('X-Frame-Options')
			render :text => new_page_view.id.to_s, :status => 200
		rescue => e
			puts e.to_s
			render :nothing => true, :status => 204
		end

	end

end