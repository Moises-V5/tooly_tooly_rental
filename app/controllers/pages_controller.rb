class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about_us]
  def home
  end

  def about_us
    @marco = User.find_by(email: "marco@ttr.com")
    @moises = User.find_by(email: "moises@ttr.com")
  end
end
