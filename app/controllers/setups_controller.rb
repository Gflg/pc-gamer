class SetupsController < ApplicationController
    def index
        @setups = Setup.all
    end

    def show
        @setup = Setup.find(params[:id])
    end

    def new
        @setup = Setup.new
    end

    def create
        @setup = Setup.new(setup_params)

        if @setup.save
            redirect_to @setup
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @setup = Setup.find(params[:id])
    end

    def update
        @setup = Setup.find(params[:id])

        if @setup.update(setup_params)
            redirect_to @setup
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @setup = Setup.find(params[:id])
        @setup.destroy

        redirect_to setups_path, status: :see_other
    end

    private

    def setup_params
        params.require(:setup).permit(
            :name,
            :processor_id,
            :motherboard_id,
            :graphics_card_id,
            :power_supply_id,
            :ram_id
        )
    end
end
