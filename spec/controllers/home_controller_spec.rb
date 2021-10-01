require 'rails_helper'

RSpec.describe HomeController do
  describe "process redirection and count increment", type: :request do
    let(:short_link) { create(:short_link) }
    before do
      get("/#{short_link.short_url_identifier}")
    end

    it "ensure increment of link_used in short_link" do
      expect(short_link.reload.link_used).to eq(1)
    end
  end
end
