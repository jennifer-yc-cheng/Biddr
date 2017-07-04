class AuctionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_auction, only: [:show]

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    # render json: auction_params
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def show
    @bid = Bid.new
  end

  def bidded
    @auctions = Auction.where(is_bidded: true)
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :end_date, :reserve_price)
  end

  def find_auction
    @auction = Auction.find params[:id]
  end

end
