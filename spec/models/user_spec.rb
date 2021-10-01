require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it "ensure the presence of email" do
      user = User.new.save

      expect(user).to eq(false)
    end
  end
end
