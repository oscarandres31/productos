class CategoriesController < ApplicationController
  #before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authorize!
  def index
    @categories = Category.all.order(name: :asc)
  end


  def new
    @category = Category.new
  end

  def edit
    category
  end

  def create
    @category = Category.new(category_params)

      if @category.save
        redirect_to categories_url, notice: t('.created')
       # format.json { render :show, status: :created, location: @category }
      else
        render :new, status: :unprocessable_entity
      #  format.json { render json: @category.errors, status: :unprocessable_entity }
      end
  end

  def update
      if category.update(category_params)
        redirect_to categories_url, notice: t('.updated')
      #  format.json { render :show, status: :ok, location: @category }
      else
        render :edit, status: :unprocessable_entity
       # format.json { render json: @category.errors, status: :unprocessable_entity }
      end
  end

  def destroy
    category.destroy
      redirect_to categories_url, notice: t('.destroyed')
     # format.json { head :no_content }

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
