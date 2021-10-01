require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  context "validations" do
    let!(:empty_url_short_link) { ShortLink.new }
    let!(:invalid_url_short_link) { ShortLink.new(url: "test invalid url") }
    let!(:valid_short_link) { ShortLink.new(url: "https://www.google.com/") }

    it "ensure presence of url" do
      short_link = empty_url_short_link.save

      expect(short_link).to eq(false)
    end

    it "ensure working url" do
      short_link = invalid_url_short_link.save

      expect(short_link).to eq(false)
    end

    it "ensures the valid url will be saved" do
      expect(valid_short_link).to be_valid
    end

    it "generate short_url_identifier after creating short_link" do
      expect { valid_short_link.save }.to change(ShortLink, :count).by(1)
      expect(valid_short_link.short_url_identifier).not_to eq(nil)
    end
  end
end
