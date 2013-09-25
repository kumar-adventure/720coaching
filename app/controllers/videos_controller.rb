class VideosController < ApplicationController
  def index
  	@videos = current_user.videos
  end

  def new
  	@video = current_user.videos.new
  end
  
  def create
  	current_user.videos.create(params[:video])
  	redirect_to athlete_videos_path
  end

  def edit
  end
end
