# frozen_string_literal: true

class Upload < ApplicationRecord
  has_one_attached :csv_file

  validate :set_check_mime_type

  private

  def set_check_mime_type
    set_error unless csv_file.content_type.include?('text/csv')
  end

  def set_error
    errors.add(:csv_file, 'Must be a CSV file')
  end
end
