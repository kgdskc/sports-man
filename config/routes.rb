Rails.application.routes.draw do
  #↓ログイン画面を/に設定するため
  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only: [:show,:edit,:update]
  
  resources :body_statuses,only: [:new,:create,:update,:edit,:index]
  get 'body_statuses/calenders' => 'body_statuses#calender_index', as: 'calenders'
  get 'body_statuses/calenders/:id' => 'body_statuses#calender_show', as: 'calender'
end
