class ContentsController < ApplicationController
  before_action :set_content, only: [:update, :destroy]

  def index
    @contents = Content.all
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      render json: @content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  def update
    if @content.update(content_params)
      render json: @content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @content.destroy
    head :no_content
  end

   private
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :content)
    end
end
