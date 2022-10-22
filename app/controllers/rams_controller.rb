class RamsController < ApplicationController
  def index
    @rams = Ram.all
  end

  def show
    @ram = Ram.find(params[:id])
  end

  def get_json
    @ram = Ram.find(params[:id])
    render json: @ram.to_json
  end

  def new
    @ram = Ram.new
  end

  def create
    @ram = Ram.new(ram_params)

    if @ram.save
      redirect_to @ram
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ram = Ram.find(params[:id])
  end

  def update
    @ram = Ram.find(params[:id])

    if @ram.update(ram_params)
      redirect_to @ram
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @ram = Ram.find(params[:id])
    @ram.destroy

    redirect_to rams_path, status: :see_other
  end

  private

  def ram_params
    params.require(:ram).permit(
      :brand,
      :model,
      :size,
      :ram_type,
      :speed,
      :dimm_type,
      :cas_latency
    )
  end
end
