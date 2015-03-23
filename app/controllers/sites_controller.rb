class SitesController < ApplicationController

	def index
		@sites = Site.all
		render :text => @sites.pluck(:domain).sort_by{|x| x }.join('<br>')
	end

end