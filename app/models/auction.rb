class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids
  has_many :watches

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

  include AASM

  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published, :reserve_met

    event :publish do
      transitions from: :draft, to: :published
    end

    event :reserve_meet do
      transitions from: :published, to: :reserve_met
    end
  end

end
