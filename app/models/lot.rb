class Lot < ActiveRecord::Base
  has_many :bid
  belongs_to :user
  # attr_accessible :title, :body
end
