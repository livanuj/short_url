require 'rails_helper'

RSpec.describe ShortLinksController, type: :request do

  let(:user) { create(:user) }
  before do
    create(:short_link, user: user)
    create(:short_link, user: user)
    create(:short_link, user: user)
  end

  it "shows all short links of the user" do
    get short_links_path

    expect(user.short_links.count).to eq(3)
  end
end
