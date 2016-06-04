#
class Topic < ActiveRecord::Base
  has_many :ratings, inverse_of: :topic
end
