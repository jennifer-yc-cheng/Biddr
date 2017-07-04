class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids

  validates :title, presence: true
  validates :details, presence: true, length: {minimum: 10}
  validates :reserve_price, numericality: { greater_than: 1}
  validate :end_date_cannot_be_in_the_past


  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  after_initialize :set_defaults

  def set_defaults
    self.start_price ||=1
  end
end
