Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    root 'posts#index'
    resources :posts, only: [:index, :show]
    resources :tags, only: [:show]
    resources :categories, only: [:show]

    namespace :admin do
      resources :posts, except: [:show, :index]
      resources :categories, except: [:show]

    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
