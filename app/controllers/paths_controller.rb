class PathsController < ApplicationController
  def index
    @foundations = Path.default_path
    @fullstack_paths = Path.fullstack_paths
  end

  def show
    @path = Path.friendly.find(params[:id])

    if @path.courses.size == 1
      redirect_to path_course_path(@path, @path.courses.first)
    end
  end
end
