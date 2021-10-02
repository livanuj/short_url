require 'rails_helper'

RSpec.describe Api::V1::ShortLinksController do
  describe "POST #create short_link", type: :request do
    let(:url) { 'https://www.google.com/' }
    let(:json_response) { JSON.parse(response.body) }

    before do
      post '/api/v1/short_links', params: { url: url }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end 

    it 'returns given url' do
      expect(json_response['url']).to eq(url)
    end

    it 'JSON body response contains expected short_link attributes' do
      expect(json_response.keys).to  match_array(['url', 'short_url_identifier', 'link_used'])
    end
  end
end
