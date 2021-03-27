class LabTasksController < ApplicationController
  before_action :set_lab_task, if: -> { params[:id].present? }
  before_action :set_garage_list, if: -> { params[:garage_list_id].present? }
  respond_to :html, :json

  def new
    @lab_task = @garage_list.lab_tasks.build
    respond_modal_with @lab_task
  end

  def edit
  end

  def create
    @lab_task = @garage_list.lab_tasks.create(lab_task_params)
    respond_modal_with @lab_task, location: garage_lists_path
  end

  def update
    if @lab_task.update(lab_task_params)
      flash[:success] = "Tareas actualizada correctamente"
    else
      flash[:error] = "No fue posible actualizar la tarea"
    end

    respond_modal_with @garage_list, location: garage_lists_path
  end

  def destroy
    @lab_task.destroy
    redirect_to garage_lists_path
  end

  private
    def set_lab_task
      @lab_task = LabTask.find(params[:id])
    end

    def set_garage_list
      @garage_list = GarageList.find(params[:garage_list_id])
    end

    def lab_task_params
      params.require(:lab_task).permit(:title, :description, :complete)
        .merge!({
          garage_list_id: @garage_list.id
        })
    end
end
