class LibrariesController < ApplicationController
  before_action :logged_in?, only: [:show]

  def index
    @libraries = Library.all
    current_user # this sets the current user
    render :index
  end

  def new
    @library = Library.new

    render :new
  end

  def create
    library_params = params.require(:library).permit(:name, :floor_count, :floor_area)
    @library = Library.create(library_params)

    redirect_to "/libraries"
  end
end