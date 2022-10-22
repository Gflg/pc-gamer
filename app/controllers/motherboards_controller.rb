class MotherboardsController < ApplicationController
  def index
    @motherboards = Motherboard.all
  end

  def show
    @motherboard = Motherboard.find(params[:id])
  end

  def get_json
    @motherboard = Motherboard.find(params[:id])
    render json: @motherboard.to_json
  end

  def new
    @motherboard = Motherboard.new
  end

  def create
    @motherboard = Motherboard.new(motherboard_params)

    if @motherboard.save
      redirect_to @motherboard
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @motherboard = Motherboard.find(params[:id])
  end

  def update
    @motherboard = Motherboard.find(params[:id])

    if @motherboard.update(motherboard_params)
      redirect_to @motherboard
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @motherboard = Motherboard.find(params[:id])
    @motherboard.destroy

    redirect_to motherboards_path, status: :see_other
  end

  private

  def motherboard_params
    params.require(:motherboard).permit(
      :brand,
      :model,
      :chipset,
      :form_factor,
      :socket_type,
      :memory_slots,
      :max_memory_support
    )
  end
end
