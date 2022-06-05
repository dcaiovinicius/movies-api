# frozen_string_literal: true

module Movies
  class Query
    def self.call(relation: Movie, options: {})
      year, title, genre, country, published_at = options.values_at(:year, :title, :genre, :country, :published_at)

      if year
        relation.where(year: year)
      elsif title
        relation.where('lower(title) ILIKE ?', "%#{title}%").order(year: :desc)
      elsif country
        relation.where(country: country).order(year: :desc)
      elsif published_at
        relation.where(published_at: published_at).order(year: :desc)
      elsif genre
        relation.where(genre: genre).order(year: :desc)
      else
        relation.order(year: :desc)
      end
    end
  end
end
