class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
  end

  def read
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path
  end

  def edit
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end
end


private

def set_task
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:title, :details, :completed)
end