Rails.application.routes.draw do
  #↓ログイン画面を/に設定するため
  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only: [:show,:edit,:update] do
    get :likes
  end

  resources :body_statuses,only: [:new,:create,:update,:edit,:index]
  get 'body_statuses/calenders' => 'body_statuses#calender_index', as: 'calenders'
  get 'body_statuses/calenders/:id' => 'body_statuses#calender_show', as: 'calender'

  #↓検索機能
  get 'search' => 'menus#search'

  resources :menus do
    #↓投稿に対するいいね♡
    resource :favorites, only: [:create, :destroy]
    #↓投稿に対するコメント
    resources :menu_comments, only: [:create, :destroy]
  end

  #↓お問い合わせ機能
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm' => 'contacts#confirm', as: 'confirm'
  post 'contacts/back' => 'contacts#back', as: 'back'
  get 'done' => 'contacts#done', as: 'done'

end
