class PageViewsController < ApplicationController

	layout false

	protect_from_forgery except: :send_page

	def send_page

		if request.get?
			render :nothing => true, :status => 204 and return
		end

		begin
			whitelist = Site.all
			is_whitelisted = false
			whitelist.each do |x|
				if URI.parse(params[:url]).host.downcase.include? x.domain
					is_whitelisted = true
					site_id = x.id
				end
			end
			render :nothing => true, :status => 204 and return if is_whitelisted == false

			if Page.select(:canonical_url).pluck(:canonical_url).include? params[:canonicalurl]
				new_page_view = PageView.new :user_id => 1, :actual_url => (params[:url] == "" ? nil : params[:url]), :page_id => (Page.find_by canonical_url: params[:canonicalurl]).id
				new_page_view.save
			else
				new_page = Page.new :canonical_url => params[:canonicalurl], :title => (params[:canonicaltitle] == "" ? nil: params[:canonicaltitle]), :page_type => (params[:ogtype] == "" ? nil: params[:ogtype]), :author => (params[:author] == "" ? nil: params[:author]), :keywords => (params[:keywords] == "" ? nil: params[:keywords]), :description => (params[:description] == "" ? nil: params[:description]), :site_id => site_id
				new_page.save

				new_page_view = PageView.new :user_id => 1, :actual_url => (params[:url] == "" ? nil : params[:url]), :page_id => new_page.id
				new_page_view.save
			end

			# response.headers.delete('X-Frame-Options')
			render :nothing => true, :status => 204
		rescue => e
			render :nothing => true, :status => 204
		end

	end

end