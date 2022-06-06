# frozen_string_literal: true

class Movie < ApplicationRecord
  REGEX_YEAR = %r{\A(20|19)\d{2}\z}

  validates :title, presence: true, length: { maximum: 200 }
  validates :genre, presence: true, length: { maximum: 20 }
  validates :country, length: { maximum: 50 }
  validates :description, presence: true

  validates :year, format: { with: REGEX_YEAR, message: I18n.t('movie.four-digit') }
  validates :slug, presence: true, uniqueness: { message: I18n.t('movie.registered_error') }

  before_validation :set_slug
  before_validation :set_published_date

  private

  def set_published_date
    self.published_at = Date.current if published_at.blank?
  end

  def set_slug
    return nil if title.blank?

    self.slug = title.parameterize
  end
end
