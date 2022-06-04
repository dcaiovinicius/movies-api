# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :title, presence: true, length: { maximum: 500 }
  validates :genre, presence: true, length: { maximum: 600 }
  validates :country, presence: true, length: { maximum: 20 }
  validates :published_at, presence: true
  validates :description, presence: true

  validates :year, presence: true, format: { with: /(19|20)\d{2}/i, message: I18n.t('movie.four-digit') }
  validates :slug, presence: true, uniqueness: { message: I18n.t('movie.registered_error') }

  before_validation :set_published_at
  before_validation :set_slug

  private

  def set_published_at
    self.published_at = DateTime.current
  end

  def set_slug
    return nil if title.blank?

    self.slug = title.parameterize
  end
end
