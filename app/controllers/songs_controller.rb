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
    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        flash[:notice] = 'Song was successfully created.'
        format.html { redirect_to :action => "index" }
      else
        format.html { render :action => "new" }
      end
    end
  end

protected
 
  def authorize
  end
  
end
