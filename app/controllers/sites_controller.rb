class SitesController < ApplicationController

	def index
		@sites = Site.all
		render :text => @sites.pluck(:domain).sort_by{|x, y| x <=> y }.join('\n')
	end

end