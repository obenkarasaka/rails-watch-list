# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]  # Nested under lists
  end

  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :bookmarks, only: [:destroy] # Only destroy should be outside
end
