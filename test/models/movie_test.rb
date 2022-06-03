# frozen_string_literal: true

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  setup do
    @movie = build(:movie)
  end

  test 'should be a valid movie' do
    assert_predicate(@movie, :valid?)
  end

  test 'should be an invalid movie' do
    movie = Movie.new
    assert_not movie.valid?
  end

  test 'should be set to current date for published_at' do
    freeze_time do
      @movie.save
      assert_equal DateTime.current, @movie.published_at
    end
  end
end
