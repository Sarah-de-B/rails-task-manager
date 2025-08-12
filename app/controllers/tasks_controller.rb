class TasksController < ApplicationController
  def list
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_params)
    @task.save!
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(strong_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def remove
    @task = Task.find(params[:id])
    @task.destroy!
    redirect_to list_path, status: :see_other
  end
  private

  def strong_params
    params.require(:task).permit(:title, :details)
  end
end
