class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :lot
  # attr_accessible :title, :body
end
