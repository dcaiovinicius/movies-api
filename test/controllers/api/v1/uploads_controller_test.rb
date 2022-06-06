# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class UploadsControllerTest < ActionDispatch::IntegrationTest
      test 'should upload the file' do
        post api_v1_uploads_url, params: { csv_file: fixture_file_upload('upload.csv', 'text/csv') }
        file = Upload.order(:created_at).last

        assert_not file.csv_file.attached?
      end
    end
  end
end
