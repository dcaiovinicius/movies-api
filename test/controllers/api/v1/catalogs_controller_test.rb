# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class CatalogsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @movie_created = create(:movie)
        @movie = attributes_for(:movie, title: 'new title')
      end

      test 'should return all movies' do
        get api_v1_catalogs_url
        assert_response :ok
      end

      test 'should only show one movie' do
        get api_v1_catalog_url(@movie_created)
        assert_response :ok
      end

      test 'should create movie' do
        assert_difference('Movie.count', 1) do
          post api_v1_catalogs_url, params: { movie: @movie }
        end
      end
    end
  end
end
