class PagesController < ApplicationController
    def index
    end

    def processors
        render json: Processor.all.to_json
    end

    def motherboards
        render json: [] and return unless params[:processor]

        find_mmy
        render json: Motherboard.where(socket_type: @processor.socket_type).to_json
    end

    def rams
        render json: [] and return unless params[:motherboard]

        find_mmy
        @processor = Processor.where(socket_type: @motherboard.socket_type).first
        render json: Ram.where(ram_type: @processor.memory_type).to_json
    end

    def graphics_cards
        render json: [] and return unless params[:ram]

        render json: GraphicsCard.all.to_json
    end

    def psus
        render json: [] and return unless params[:graphics_card]

        render json: PowerSupply.all.to_json
    end

    private

    def find_mmy
        @processor = Processor.find_by(id: params[:processor].presence)
        @motherboard = Motherboard.find_by(id: params[:motherboard].presence)
        @ram = Ram.find_by(id: params[:ram].presence)
    end
end
