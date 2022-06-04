# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class CatalogsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @movie = create(:movie)
      end

      test 'should return all movies' do
        get api_v1_catalogs_url
        assert_response :ok
      end

      test 'should only show one movie' do
        get api_v1_catalog_url(@movie)
        assert_response :ok
      end
    end
  end
end
