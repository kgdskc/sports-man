Rails.application.routes.draw do
  #↓ログイン画面を/に設定するため
  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only: [:show,:edit,:update]
end
