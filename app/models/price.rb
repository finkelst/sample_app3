class Price < ActiveRecord::Base
  attr_accessible :date, :price
  belongs_to :user
  validates :user_id, presence: true
  validates_uniqueness_of :user_id, :scope => [:date]
end
