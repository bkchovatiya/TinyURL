class Url < ApplicationRecord
  has_one :link # If we need has many relation it can be easily change
  has_many :visits, through: :link


  validates :original,
            :presence => true,
            :format => { :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, 
                         :multiline => true,
                         :message => "Plase enter a valid URL." },
            :uniqueness => { :case_sensitive => false }

  after_create :create_shortened_url

  def create_shortened_url
    url_hash = Digest::SHA1.hexdigest(id.to_s)

    Link.create(identifier: url_hash, url: self)
  end

  def identifier
    link&.identifier
  end
end
