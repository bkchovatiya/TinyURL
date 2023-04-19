class Visit < ApplicationRecord
  belongs_to :link

  validates :ip, presence: true
end
