class ShortLink < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user, optional: true

  after_create :update_short_url

  validates :url, presence: true
  validate :working_url

  def to_attributes
    {
      url: url,
      short_url_identifier: short_url_identifier,
      link_used: link_used
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
      errors.add(:url, "Please enter the valid URL")
    end
  rescue URI::InvalidURIError
    errors.add(:url, "Please enter the valid URL")
  end
end
