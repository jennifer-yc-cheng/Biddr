class BidsController < ApplicationController
  def create
    @auction = Auction.find params[:auction_id]
    @bid = Bid.new bid_params
    @bid.user_id = current_user.id
    @bid.auction = @auction
    if @bid.save
      @auction.update(is_bidded: true)
      if(@bid.price >= @auction.reserve_price)
        @auction.reserve_meet!
      end
      redirect_to auction_path(@auction)
    else
      render 'auctions/show'
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:price)
  end
end
