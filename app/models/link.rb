class Link < ApplicationRecord
  belongs_to :url
  has_many :visits
end
