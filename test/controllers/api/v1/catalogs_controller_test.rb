# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class CatalogsControllerTest < ActionDispatch::IntegrationTest
      test 'GET /api/v1/movies' do
        get api_v1_catalogs_url
        assert_response :ok
      end
    end
  end
end
