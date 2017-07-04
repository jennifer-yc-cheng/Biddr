class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user

  validates :price, presence: true, numericality: { greater_than: 1}
  validate :new_bid_cannot_be_lower


  def new_bid_cannot_be_lower
    if price.present?
      if self.auction.bids.length > 0 && price < self.auction.bids.order(created_at: :desc).first.price
        errors.add(:price, "can't be lower than last bid")
      end
    end
  end

end
