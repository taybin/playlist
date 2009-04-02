class SongsController < ApplicationController
  # GET /songs
  def index
    @songs = Song.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /songs/new
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
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

end
