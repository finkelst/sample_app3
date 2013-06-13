class Price < ActiveRecord::Base
  attr_accessible :date, :price
  belongs_to :user
  validates :user_id, presence: true
  validates :date, presence: true
  validates :price, presence: true
  validates_uniqueness_of :date, :scope => [:user_id]
  
  def mk_bal
    ActionController::Base.helpers.number_to_currency(self.price, :precision => 2)
  end
end
