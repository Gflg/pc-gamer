class PagesController < ApplicationController
    def index
    end

    def create
        @setup = Setup.new(
            name: params[:name],
            processor_id: params[:processor],
            motherboard_id: params[:motherboard],
            graphics_card_id: params[:graphics_card],
            power_supply_id: params[:psu],
            ram_id: params[:ram]
        )

        if @setup.save
            redirect_to @setup
        else
            render root_path
        end
    end

    def processors
        render json: Processor.all.to_json
    end

    def motherboards
        render json: [] and return unless params[:processor]
        session[:current_processor_id] = params[:processor]

        find_mmy
        render json: Motherboard.where(socket_type: @processor.socket_type).to_json
    end

    def rams
        render json: [] and return unless params[:motherboard]
        session[:current_motherboard_id] = params[:motherboard]

        find_mmy
        @processor = Processor.where(socket_type: @motherboard.socket_type).first
        render json: Ram.where(ram_type: @processor.memory_type).to_json
    end

    def graphics_cards
        render json: [] and return unless params[:ram]
        session[:current_ram_id] = params[:ram]

        find_mmy
        render json: GraphicsCard.all.to_json
    end

    def psus
        render json: [] and return unless params[:graphics_card]
        session[:current_graphics_card_id] = params[:graphics_card]

        find_mmy
        puts @processor
        puts @motherboard
        puts @ram
        puts @graphics_card
        render json: PowerSupply.all.to_json
    end

    private

    def find_mmy
        @processor ||= Processor.find_by(id: session[:current_processor_id].presence)
        @motherboard ||= Motherboard.find_by(id: session[:current_motherboard_id].presence)
        @ram ||= Ram.find_by(id: session[:current_ram_id].presence)
        @graphics_card ||= GraphicsCard.find_by(id: session[:current_graphics_card_id].presence)
    end

    def setup_params
        params.permit(
            :name,
            :processor,
            :motherboard,
            :graphics_card,
            :psu,
            :ram
        )
    end
end
