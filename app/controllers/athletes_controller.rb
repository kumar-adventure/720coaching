class AthletesController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource :class => false

  def home

  end

  def profile
  end

  def my_coaches


  end

  def my_videos

  end

  def view_coach

  end
end
