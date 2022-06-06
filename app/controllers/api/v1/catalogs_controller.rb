# frozen_string_literal: true

module Api
  module V1
    class CatalogsController < ApiController
      before_action :set_movie, only: %i[show update destroy]

      # GET /api/v1/catalogs
      def index
        @movies = Movies::Query.call(options: params)
        render json: @movies, only: %i[id title genre country year published_at description]
      end

      # GET /api/v1/catalogs/uuid
      def show
        render json: @movie, only: %i[id title genre country year published_at description]
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

      # PUT/PATCH /api/v1/catalogs/uuid
      def update
        if @movie.update(movie_params)
          render json: { message: 'Update movie' }, status: :ok
        else
          render json: { status: 'ERROR', errors: @movie.errors }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/catalogs/uuid
      def destroy
        @movie.destroy
        render json: { message: 'Deleted movie' }, status: :ok
      end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      end

      def movie_params
        params.require(:movie).permit(:title, :genre, :country, :year, :published_at, :description)
      end
    end
  end
end
