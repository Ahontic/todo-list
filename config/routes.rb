# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth/sign_in', to: 'authentication#login'
      post '/auth', to: 'users#create'

      resources :projects do
        resources :tasks, only: %i[index show create] do
          member do
            put :status
            put :deadline
          end
        end
      end
    end
  end
end
