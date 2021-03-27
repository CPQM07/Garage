class GarageListsController < ApplicationController
  before_action :set_garage_list, if: -> { params[:id].present? }
  respond_to :html, :json

  def index
    @garage_lists = GarageList.all
  end

  def new
    @garage_list = GarageList.new
    respond_modal_with @garage_list
  end

  def edit
  end

  def create
    @garage_list = GarageList.new(garage_list_params)

    if @garage_list.save
      flash[:success] = "Lista de tareas creada correctamente"
    else
      flash[:error] = "No fue posible crear la lista de tareas"
    end
    
    respond_modal_with @garage_list, location: garage_lists_path
  end

  def update
    @garage_list = @garage_list.update(garage_list_params)
    respond_modal_with @garage_list, location: garage_lists_path
  end

  def destroy
    @garage_list.destroy
    redirect_to garage_lists_path
  end

  private
    def set_garage_list
      @garage_list = GarageList.find(params[:id])
    end

    def garage_list_params
      params.require(:garage_list).permit(:title, :all_complete)
    end
end
