class ImagesController < ApplicationController
  respond_to? :json

  def create
    image_params[:image].open if image_params[:image].tempfile.closed?

    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.json { render json: { url: @image.image_url }, status: :ok }
      else
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def image_params
    params.require(:image).permit(:image, :image_data)
  end
end
