class SitesController < ApplicationController

	def index
		@sites = Site.all
		render :text => @sites.pluck(:domain).join(', ')
	end

end