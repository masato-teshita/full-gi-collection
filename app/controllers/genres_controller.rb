class GenresController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @genres = Genre.all
  end
end
