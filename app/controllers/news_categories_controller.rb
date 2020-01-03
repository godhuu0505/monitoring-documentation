class NewsCategoriesController < ApplicationController
  before_action :set_news_category, only: [:show, :edit, :update, :destroy]

  def index
    @news_categories = NewsCategory.all
  end

  def show
  end

  def new
    @news_category = NewsCategory.new
  end

  def edit
  end

  def create
    @news_category = NewsCategory.new(news_category_params)

    respond_to do |format|
      if @news_category.save
        format.html { redirect_to @news_category, notice: 'News category was successfully created.' }
        format.json { render :show, status: :created, location: @news_category }
      else
        format.html { render :new }
        format.json { render json: @news_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @news_category.update(news_category_params)
        format.html { redirect_to @news_category, notice: 'News category was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_category }
      else
        format.html { render :edit }
        format.json { render json: @news_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @news_category.destroy
    respond_to do |format|
      format.html { redirect_to news_categories_url, notice: 'News category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_news_category
      @news_category = NewsCategory.find(params[:id])
    end

    def news_category_params
      params.require(:news_category).permit(:name)
    end
end
