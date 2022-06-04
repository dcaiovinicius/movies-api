# frozen_string_literal: true

class AddSlugToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :slug, :string, unique: true, null: false
  end
end
