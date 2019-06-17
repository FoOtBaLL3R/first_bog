Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    root 'posts#index'
    resources :posts
    resources :tags, only: [:show]
    resources :categories
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
