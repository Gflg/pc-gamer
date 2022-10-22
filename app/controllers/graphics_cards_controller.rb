class GraphicsCardsController < ApplicationController
  def index
    @graphics_cards = GraphicsCard.all
  end

  def show
    @graphics_card = GraphicsCard.find(params[:id])
  end

  def get_json
    @graphics_card = GraphicsCard.find(params[:id])
    render json: @graphics_card.to_json
  end

  def new
    @graphics_card = GraphicsCard.new
  end

  def create
    @graphics_card = GraphicsCard.new(graphics_card_params)

    if @graphics_card.save
      redirect_to @graphics_card
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @graphics_card = GraphicsCard.find(params[:id])
  end

  def update
    @graphics_card = GraphicsCard.find(params[:id])

    if @graphics_card.update(graphics_card_params)
      redirect_to @graphics_card
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @graphics_card = GraphicsCard.find(params[:id])
    @graphics_card.destroy

    redirect_to graphics_cards_path, status: :see_other
  end

  private

  def graphics_card_params
    params.require(:graphics_card).permit(
      :brand,
      :model,
      :memory,
      :memory_interface,
      :length,
      :interface,
      :chipset,
      :base_clock,
      :clock_speed,
      :frame_sync
    )
  end
end
