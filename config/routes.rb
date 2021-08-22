Rails.application.routes.draw do
  #↓ログイン画面を/に設定するため
  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only: [:show,:edit,:update] do
    get :likes
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :body_statuses,only: [:new,:create,:update,:edit,:index]
  resources :calenders,only: [:show,:index]

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
