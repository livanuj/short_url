class ShortLink < ApplicationRecord

  belongs_to :user, optional: true

  after_create :update_short_url

  validates :url, presence: true
  validate :working_url

  def to_attributes
    {
      url: url,
      short_url_identifier: short_url_identifier
    }
  end

  private

  def update_short_url
    alphanumeric = SecureRandom.alphanumeric(7)

    update(short_url_identifier: alphanumeric)
  end

  def working_url
    uri = URI.parse(url)
    
    unless uri.is_a?(URI::HTTP) && !uri.host.nil?
      errors.add(:url, "invalid")
    end
  rescue URI::InvalidURIError
    errors.add(:url, "invalid")
  end
end
