class ProjectsController < ApplicationController
before_action :authenticate_user!
before_action :project_find, only: [:update, :destroy]


  def index
    @projects = current_user.projects.order(created_at: :desc)
  end

  def show
      project_find
  end

  def new
  end

  def create
      @project = current_user.projects.new(project_params)
      if @project.save
        redirect_to @project
      else
        render action: 'new'
      end
  end

  def edit
      project_find
  end

  def update
    @project.update(project_params)
    redirect_to @project       
  end

  def destroy
      
      @project.destroy

      redirect_to projects_path
  end



private

  def project_params
    params.require(:project).permit(:name)
  end

  def project_find
  @project = current_user.projects.find(params[:id])
  end
end
