class AdminController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to( uri || { :action => "index" } )
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    elsif User.count < 1
      redirect_to :controller => "users", :action => "new"
    end
  end

  def logout
  end

  def index
    @total_songs = Song.count
  end

end
