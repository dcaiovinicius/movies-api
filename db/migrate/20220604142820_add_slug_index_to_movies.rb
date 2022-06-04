# frozen_string_literal: true

class AddSlugIndexToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :slug, :string
    add_index :movies, :slug, unique: true
  end
end
