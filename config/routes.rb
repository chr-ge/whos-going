# frozen_string_literal: true

Rails.application.routes.draw do
  resources :contacts
  resources :events
  root 'contacts#index'
end
