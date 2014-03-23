class PageController < ApplicationController
  def meetings
    @meets = Lot.limit(3)
  end

  def create_meet
  end

  def profile
  end

  def about_us
  end

  def place
  end

  end
