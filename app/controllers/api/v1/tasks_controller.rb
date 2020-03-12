# frozen_string_literal: true

class Api::V1::TasksController < ApplicationController
  before_action :project_id_find
  before_action :task_find, only: %i[update destroy move_up move_down status deadline show]

  def index
    @project.tasks
    render json: @project.tasks
  end

  def create
    @project.tasks.create(task_params)
  end

  def update
    @task.update(task_params)
  end

  def show
    render json: @task
  end

  def destroy
    @task.destroy
  end

  def status
    @task.toggle!(:status)
  end

  def deadline
    @task.update(task_params)
    deadline = @task.deadline
    redirect_to project_task_path(@project) if @task.update(deadline: deadline)
  end

  def move_up
    @task.move_higher
  end

  def move_down
    @task.move_lower
  end

  private

  def task_params
    params.permit(:name, :status, :position, :deadline)
  end

  def task_find
    @task = @project.tasks.find(params[:id])
  end

  def project_id_find
    @project = Project.find(params[:project_id])
  end
end
