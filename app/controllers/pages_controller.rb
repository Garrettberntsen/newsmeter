class PagesController < ApplicationController

	layout false

	protect_from_forgery except: :send_page

	def send_page

		if request.get?
			render :nothing => true, :status => 204 and return
		end

		begin
			new_page = Page.new :user_id => 1, :actual_url => (params[:url] == "" ? nil : params[:url]), :og_url => (params[:ogurl] == "" ? nil : params[:ogurl]), :og_title => (params[:ogtitle] == "" ? nil : params[:ogtitle]), :og_type => (params[:ogtype] == "" ? nil : params[:ogtype]), , :domain => (params[:url] == "" ? nil : URI.parse(params[:url]).host)
			new_page.save
			# response.headers.delete('X-Frame-Options')
			render :nothing => true, :status => 204
		rescue => e
			render :nothing => true, :status => 204
		end

	end

end