# frozen_string_literal: true

module Movies
  class Query
    # ALLOWED_PARAMS = %i[year title].freeze

    def self.call(relation: Movie, options: {})
      return relation.all if options.values_at(:year, :title, :country, :published_at).all?(nil)

      relation = search_by_year(relation, options[:year]) if options[:year]
      relation = search_by_title(relation, options[:title]) if options[:title]
      relation = search_by_country(relation, options[:country]) if options[:country]
      relation = search_by_published_at(relation, options[:published_at]) if options[:published_at]

      relation
    end

    def self.search_by_published_at(relation, published_at)
      relation.where(published_at: published_at)
    end

    def self.search_by_country(relation, country)
      relation.where(country: country)
    end

    def self.search_by_year(relation, year)
      relation.where(year: year)
    end

    def self.search_by_title(relation, title)
      relation.where('lower(title) ILIKE ?', "%#{title}%")
    end
  end
end
