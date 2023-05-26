class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
