class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    return home_athlete_path if resource.has_role? :athlete
    return home_coach_path if resource.has_role? :coach
  end
end
