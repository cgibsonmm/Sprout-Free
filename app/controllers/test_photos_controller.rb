class TestPhotosController < ApplicationController
  before_action :set_test_photo, only: [:show, :edit, :update, :destroy]

  # GET /test_photos
  # GET /test_photos.json
  def index
    @test_photos = TestPhoto.all
  end

  # GET /test_photos/1
  # GET /test_photos/1.json
  def show
  end

  # GET /test_photos/new
  def new
    @test_photo = TestPhoto.new
  end

  # GET /test_photos/1/edit
  def edit
  end

  # POST /test_photos
  # POST /test_photos.json
  def create
    @test_photo = TestPhoto.new(test_photo_params)

    respond_to do |format|
      if @test_photo.save
        format.html { redirect_to @test_photo, notice: 'Test photo was successfully created.' }
        format.json { render :show, status: :created, location: @test_photo }
      else
        format.html { render :new }
        format.json { render json: @test_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_photos/1
  # PATCH/PUT /test_photos/1.json
  def update
    respond_to do |format|
      if @test_photo.update(test_photo_params)
        format.html { redirect_to @test_photo, notice: 'Test photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_photo }
      else
        format.html { render :edit }
        format.json { render json: @test_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_photos/1
  # DELETE /test_photos/1.json
  def destroy
    @test_photo.destroy
    respond_to do |format|
      format.html { redirect_to test_photos_url, notice: 'Test photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_photo
      @test_photo = TestPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_photo_params
      params.require(:test_photo).permit(:image)
    end
end
