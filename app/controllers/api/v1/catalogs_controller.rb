# frozen_string_literal: true

module Api
  module V1
    class CatalogsController < ApiController
      # GET /api/v1/movies
      def index
        @movies = Movie.all

        render json: @movies
      end
    end
  end
end
