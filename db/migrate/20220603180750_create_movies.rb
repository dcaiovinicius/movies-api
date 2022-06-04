# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :title
      t.string :genre
      t.string :country
      t.string :year
      t.datetime :published_at
      t.text :description

      t.timestamps
    end
  end
end
