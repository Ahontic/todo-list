class ProjectsController < ApplicationController

  def new
  end

  def create
      @project = Project.new(project_params)
      if @project.valid?
        @project.save
      else
        render action: 'new'
      end
  end




private

  def project_params
    params.require(:project).permit(:name)
  end

end
