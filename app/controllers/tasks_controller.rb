class TasksController < ApplicationController
  before_action :project_id_find
  before_action :task_find, only: [:update, :destroy,:move_up,:move_down,:status,:deadline]

  def create
    
    @project.tasks.create(task_params)
    redirect_to project_path(@project)
  end

  def update
    @task.update(task_params)
    redirect_to project_path(@project)
  end

  def destroy
      @task.destroy
      redirect_to project_path(@project)
  end

  def status
    @task.toggle!(:status)
    redirect_to project_path(@project)
  end

  def deadline
    @task.update(task_params)
    deadline = @task.deadline
    if @task.update(deadline: deadline)
    redirect_to project_task_path(@project)
  end
  end
  
  def move_up
      @task.move_higher
      redirect_to project_path(@project)
  end

  def move_down
      @task.move_lower
      redirect_to project_path(@project)
  end

private

  def task_params
    params.require(:task).permit(:name,:status,:position,:deadline)

  end

  def task_find
  @task = @project.tasks.find(params[:id])
  end

  def project_id_find
  @project = Project.find(params[:project_id])
  end

end