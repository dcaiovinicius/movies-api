# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :catalogs
      resources :uploads, only: %i[create]
    end
  end
end
