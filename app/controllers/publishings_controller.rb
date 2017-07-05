class PublishingsController < ApplicationController
  def create
    auction = Auction.find params[:auction_id]
    if auction.publish!
      redirect_to auction, notice: 'Auction published!'
    else
      redirect_to auction, notice: 'Auction not published!'
    end
  end
end
