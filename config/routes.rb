Rails.application.routes.draw do
  get 'sessions/new'

  root 'tops#index'

  get 'tops/index'
  get 'webpages/index'

  resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :sessions, only: [:new, :create, :destroy]

  resources :favorites, only: [:create, :destroy, :index]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
