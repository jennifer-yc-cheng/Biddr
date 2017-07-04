class AuctionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_acution, only: [:show]

  def index
  end

  def new
    @auction = Auction.new
  end

  def create
    # render json: auction_params
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to home_path
    else
      render :new
    end
  end

  def show
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :end_date, :reserve_price)
  end

  def find_auction
    @auction = Auction.find params[:id]
  end

end
