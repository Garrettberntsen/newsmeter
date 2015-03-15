class PageViewsController < ApplicationController

	layout false

	protect_from_forgery except: :send_page

	def send_page

		if request.get?
			render :nothing => true, :status => 204 and return
		end

		begin
			whitelist = Site.select(:domain).pluck(:domain)
			is_whitelisted = false
			whitelist.each do |x|
				is_whitelisted = true if URI.parse(params[:url]).host.downcase.include? x
			end
			render :nothing => true, :status => 204 and return if is_whitelisted == false

			new_page = PageView.new :user_id => 1, :actual_url => (params[:url] == "" ? nil : params[:url]), :og_url => (params[:canonicalurl] == "" ? nil : params[:canonicalurl]), :og_title => (params[:canonicaltitle] == "" ? nil : params[:canonicaltitle]), :og_type => (params[:ogtype] == "" ? nil : params[:ogtype]), :domain => (params[:url] == "" ? nil : URI.parse(params[:url]).host)
			new_page.save
			# response.headers.delete('X-Frame-Options')
			render :nothing => true, :status => 204
		rescue => e
			render :nothing => true, :status => 204
		end

	end

end