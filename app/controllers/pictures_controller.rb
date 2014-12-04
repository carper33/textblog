class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @uploaded_picture = UploadedPicture.new
    @uploaded_picture.user_id = current_user.id
    @uploaded_picture.picture = params[:picture]
    @uploaded_picture.save
    render partial: "shared/uploaded_picture", locals: {uploaded_picture: @uploaded_picture}
  end

  def index
    @uploaded_pictures = UploadedPicture.all
  end
end
