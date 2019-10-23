class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :destroy, :show]
  layout 'portfolio'
  def index
    @portfolio_items = Portfolio.friendly.all
  end 

  def angular
    @angular_portfolio_items = Portfolio.friendly.angular
  end
  
  def new
    @portfolio_item = Portfolio.friendly.new
    3.times do @portfolio_item.technologies.build end 
  end

  def create
    @portfolio_item = Portfolio.friendly.new(portfolio_params)
     respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end


  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    binding.pry
  end 

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record was successfully destroyed.' }
    end
  end 

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )
  end 

  private

  def set_portfolio
    @portfolio_item = Portfolio.friendly.find(params[:id])
  end 

end
