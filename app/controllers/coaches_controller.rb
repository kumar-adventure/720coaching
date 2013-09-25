class CoachesController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource :class => :controller

  def home
  end

  def show
    @coach = User.where(id: params[:id]).first
  end

  def profile
  end
end
