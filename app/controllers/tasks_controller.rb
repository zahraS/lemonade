class TasksController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.order("created_at desc")
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
    redirect_to(:tasks)
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.update(task_params)
    redirect_to(:tasks)
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
