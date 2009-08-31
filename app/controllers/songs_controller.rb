class SongsController < ApplicationController
  # GET /songs
  def index
    @songs = Song.find(:all)
    @song = Song.new
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST /songs
  def create
    respond_to do |format|
      flash[:notice] = 'New songs disabled.'
      format.html { redirect_to :action => "index" }
    end
  end

protected
 
  def authorize
  end
  
end
