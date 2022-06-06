# frozen_string_literal: true

module Uploads
  class Import
    def self.call(file:)
      movies = []

      file.csv_file.open do |csv|
        CSV.parse(File.read(csv.path), headers: true, header_converters: :symbol) do |row|
          movies << create_movie_attrs(attrs: row)
        end
      end

      file.csv_file.purge

      Movie.create!(movies)
    end

    def self.create_movie_attrs(attrs:)
      [
        title: attrs[:title],
        genre: attrs[:type],
        country: attrs[:country],
        year: attrs[:release_year],
        published_at: attrs[:date_added],
        description: attrs[:description]
      ]
    end
  end
end
