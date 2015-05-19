class SessionsController < ApplicationController
	# As per comment here: http://stackoverflow.com/questions/15351985/session-not-persisting-across-redirect-with-omniauth-and-rails-4
	# skip_before_filter :verify_authenticity_token

  def new
    redirect_to({:controller => 'users', :action => 'show'}, :notice => "You are already logged in.") if current_user
  end

  def create
  	auth_hash = request.env['omniauth.auth']
  	x = auth_hash.extra.raw_info.friends.data
    z = ""
    current_provider_friends = []
    x.each do |y|
      z += y['name'] + " (" + y['id'] +")<br>"
      current_provider_friends << y['id']
    end
    current_provider_friends = Authorization.select(:user_id).where('uid in (?) and provider = ?', current_provider_friends, auth_hash.provider).pluck(:user_id)

  	if session[:user_id]
  		# Means our user is signed in. Add the authorization to the user
  		User.find(session[:user_id]).add_provider(auth_hash)

  	else
  		#Log him in or sign him up
  		auth = Authorization.find_or_create(auth_hash)

  		# Create the session
  		session[:user_id] = auth.user.id

  	end

    puts current_provider_friends

    new_newsmeter_friends = User.select(:id).where('id in (?) and id not in (?)', current_provider_friends, current_user.friendships.pluck(:friend_id)).pluck(:id)
    puts new_newsmeter_friends
    new_newsmeter_friends.each do |new_friend|
      x = Friendship.new :user_id => current_user.id, :friend_id => new_friend, :sharing_scope => "restricted"
      x.save
    end

    render :text => "Welcome, #{current_user.name}! Your friends are: #{z}"

  end

  def failure
  	render :text => "Sorry, but you didn't allow access to our app!"
  end

  def destroy
  	session[:user_id] = nil
  	render :text => "You've logged out!"
  end

end
