# frozen_string_literal: true

module Api
  module V1
    class CatalogsController < ApiController
      # GET /api/v1/catalogs
      def index
        @movies = Movies::Query.call(options: params)
        render json: @movies, only: %i[id title genre country year published_at]
      end

      # GET /api/v1/catalogs/uuid
      def show
        @movie = Movie.find(params[:id])
        render json: @movie, only: %i[id title genre country year published_at]
      end

      # POST /api/v1/catalogs
      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          render json: { message: 'Saved movie' }, status: :ok
        else
          render json: { status: 'ERROR', errors: @movie.errors }, status: :unprocessable_entity
        end
      end

      private

      def movie_params
        params.require(:movie).permit(:title, :genre, :country, :year, :published_at, :description)
      end
    end
  end
end
