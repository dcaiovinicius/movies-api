# frozen_string_literal: true

module Api
  module V1
    class CatalogsController < ApiController
      # GET /api/v1/movies
      def index
        @movies = Movies::Query.call(options: params)
        render json: @movies, only: %i[title genre country year published_at]
      end
    end
  end
end
