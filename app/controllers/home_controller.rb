class HomeController < ApplicationController

  def index
  end

  def process_short_url
    short_link = ShortLink.find_by(short_url_identifier: params[:short_url])

    if short_link.present?
      short_link.update(link_used: short_link.link_used + 1)
      redirect_to short_link.url
    else
      redirect_to root_path
    end
  end
end