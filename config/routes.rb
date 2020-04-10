Rails.application.routes.draw do
  get 'tags/:tag', to: 'claims#index', as: :tag

  resources :affiliations
  resources :resources

  devise_for :users

  devise_scope :user do
    get '/users/' => 'claims#index'
  end

  resources :resources do
      member do
        post :export
      end
  end

  resources :claims do
    resources :claim_reviews do
      resources :steps, only: [:show, :update], controller: 'claim_review/steps'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :srcs do
    resources :src_reviews do
      resources :steps, only: [:show, :update], controller: 'src_review/steps'
    end
  end

  resources :media do
    resources :medium_reviews do
      resources :steps, only: [:show, :update], controller: 'medium_review/steps'
    end
  end

  root 'claims#index'

  resources :posts do
    get :autocomplete_user_affiliation, on: :collection
  end
end
