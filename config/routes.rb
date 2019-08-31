Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "projects#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :tasks, only: [:edit, :create, :update, :destroy] do 
  member do
    put :move_up
    put :move_down
    put :status
    put :deadline
  end
end  
    end
         
end