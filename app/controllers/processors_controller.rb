class ProcessorsController < ApplicationController
  def index
    @processors = Processor.all
  end

  def show
    @processor = Processor.find(params[:id])
  end

  def new
    @processor = Processor.new
  end

  def create
    @processor = Processor.new(processor_params)

    if @processor.save
      redirect_to @processor
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @processor = Processor.find(params[:id])
  end

  def update
    @processor = Processor.find(params[:id])

    if @processor.update(processor_params)
      redirect_to @processor
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @processor = Processor.find(params[:id])
    @processor.destroy

    redirect_to processors_path, status: :see_other
  end

  private

  def processor_params
    params.require(:processor).permit(
      :brand,
      :model,
      :cores,
      :threads,
      :socket_type,
      :base_speed,
      :turbo_speed,
      :architechture,
      :core_family,
      :integrated_graphics,
      :memory_type,
      :memory_frequency,
      :series,
      :generation
    )
  end
end
