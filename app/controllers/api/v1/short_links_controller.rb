module Api
  module V1
    class ShortLinksController < ApplicationController

      def create
        short_link = ShortLink.new(short_link_params)
        short_link.user = current_user if user_signed_in?

        if short_link.save
          render json: short_link.to_attributes, status: 200
        else
          render json: { message: short_link.errors.full_messages }, status: 400
        end
      end

      private

      def short_link_params
        params.permit(:url)
      end
    end
  end
end