class TasksController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
    respond_with(@tasks)
  end

  def show
    @task = current_user.tasks.find(params[:id])
    respond_with(@task)
  end

  def new
    @task = current_user.tasks.new
    respond_with(@task)
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.save
    respond_with(@task)
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with(@task)
  end

  private
    def task_params
      params.require(:task).permit(:done, :description)
    end
end
