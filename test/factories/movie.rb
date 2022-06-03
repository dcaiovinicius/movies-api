# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { 'Reasons Why' }
    genre { 'TV Show' }
    country { 'United States' }
    year {  Date.strptime('2001', '%y').year }
    published_at { DateTime.current }
    description { 'A classmate receives a series of tapes that unravel the mystery of her tragic choice.' }
  end
end
