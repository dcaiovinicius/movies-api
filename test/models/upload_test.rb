# frozen_string_literal: true

require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  setup do
    @upload = Upload.new
    @upload.csv_file.attach(io: File.open("#{fixture_path}netflix.csv"), filename: 'netflix.csv')
  end

  test 'should be a valid upload' do
    @upload.save

    file = Upload.order(:created_at).last
    assert_predicate(file.csv_file, :attached?)
  end

  test 'should only accept csv files' do
    @upload.csv_file.attach(io: File.open("#{fixture_path}netflex_invalid"),
                            filename: 'netflex_invalid', content_type: 'text/plan')
    @upload.save

    assert_includes @upload.errors[:csv_file], 'Must be a CSV file'
  end
end
