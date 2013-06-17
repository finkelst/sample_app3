class Price < ActiveRecord::Base
  attr_accessible :date, :price
  belongs_to :user
  validates :user_id, presence: true
  validates :date, presence: true
  validates :price, presence: true
  validates_uniqueness_of :date, :scope => [:user_id]
  validate :validate_date_in_past
  
  protected
  
  def validate_date_in_past
    # make sure date isn't in the future
    self.errors.add(:date, "cannot be in the future") if self.date.future?
  end
end
