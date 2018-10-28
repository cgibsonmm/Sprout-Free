class ForumPostPhotosController < ApplicationController
  before_action :set_forum_post_photo, only: [:show, :edit, :update, :destroy, :photo_url]
  before_action :authenticate_user!, except: [:show]
  # before_action :post_owner?, except: [:index, :show]

  # GET /forum_post_photos
  # GET /forum_post_photos.json
  def index
    @forum_post_photos = ForumPostPhoto.all
  end

  # GET /forum_post_photos/1
  # GET /forum_post_photos/1.json
  def show
  end

  # GET /forum_post_photos/new
  def new
    @forum_post_photo = current_user.forum_post_photos.build
  end

  # GET /forum_post_photos/1/edit
  def edit
  end

  def photo_url
    redirect_to @forum_post_photo.image.url
  end

  # POST /forum_post_photos
  # POST /forum_post_photos.json
  def create
    @forum_post_photo = current_user.forum_post_photos.build(forum_post_photo_params)

    respond_to do |format|
      if @forum_post_photo.save
        format.html { redirect_to @forum_post_photo, notice: 'Forum post photo was successfully created.' }
        format.json { render :show, status: :created, location: @forum_post_photo }
      else
        format.html { render :new }
        format.json { render json: @forum_post_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_post_photos/1
  # PATCH/PUT /forum_post_photos/1.json
  def update
    respond_to do |format|
      if @forum_post_photo.update(forum_post_photo_params)
        format.html { redirect_to @forum_post_photo, notice: 'Forum post photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum_post_photo }
      else
        format.html { render :edit }
        format.json { render json: @forum_post_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_post_photos/1
  # DELETE /forum_post_photos/1.json
  def destroy
    @forum_post_photo.destroy
    respond_to do |format|
      format.html { redirect_to forum_post_photos_url, notice: 'Forum post photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # def post_owner?
  #   redirect_to root_path if @forum_post_photo.user_id != current_user.id
  # end
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_post_photo
      @forum_post_photo = ForumPostPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_post_photo_params
      params.require(:forum_post_photo).permit(:image, :user_id, photos: [])
    end
end
