class TasksController < ApplicationController
  def create
    task = Session.find(params[:id]).tasks.build(task_params)
    task.save if task.valid?
    render json: task
  end

  def top
    top5 = Task.top_5_studied(params[:id])
    render json: top5
  end

  def task_params
    params.require(:task).permit(:name, :time)
  end
end
