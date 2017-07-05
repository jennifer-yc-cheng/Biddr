class WatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_auction

  def create
    @watch = Watch.new(auction: @auction, user: current_user)

    if @watch.save
      flash.now[:notice] = 'watching this auction'
    else
      flash[:alert] = "._."
    end

    respond_to do |format|
      format.js { render }
    end
  end

  def destroy
    watch = Watch.find(params[:id])

    if watch.destroy
      flash[:notice] = "stopped watching this auction"
    end

    respond_to do |format|
      format.js { render }
    end
  end

  private
  def find_auction
    @auction = Auction.find(params[:auction_id])
  end

end
