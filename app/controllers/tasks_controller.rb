class TasksController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :update, :destroy]
  before_action :task_find, only: [:update, :destroy]


  def create
    @project = Project.find(params[:project_id])
    @project.tasks.create(task_params)
    
    redirect_to project_path(@project)
  end

def update
    
    @task.update(task_params)

    redirect_to project_path

     
  end

  def destroy
     
      @task.destroy

      redirect_to project_path
  end

private

  def task_params
    params.require(:task).permit(:name,:status)

  end

  def task_find
  @task = Task.find(params[:project_id])
  end


end