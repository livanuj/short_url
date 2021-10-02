class ShortLinksController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @short_links = current_user.short_links
  end
end
