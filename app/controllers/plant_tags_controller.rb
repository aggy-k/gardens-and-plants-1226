class PlantTagsController < ApplicationController
  before_action :set_plant, only: [:new, :create]

  def new
    @plant_tag = PlantTag.new
  end

  def create
    puts "params => #{params}"
    # @plant_tag = PlantTag.new(plant_tag_params)
    # @plant_tag.plant = @plant

    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   render :new, status: 422
    # end

    params[:plant_tag][:tag_id].each do |tag_id|
      PlantTag.find_or_create_by(plant: @plant, tag_id: tag_id)
    end

    redirect_to garden_path(@plant.garden)
  end

  private
    # def plant_tag_params
    #   params.require(:plant_tag).permit(:tag_id)
    # end

    def set_plant
      @plant = Plant.find(params[:plant_id])
    end
end
