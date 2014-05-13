Rails.application.routes.draw do


  resources :users, only: [:search, :show], path: 'profiles' do
  	collection do
  	  get :search
  	end
  	member do
      post :follow
      delete :unfollow
  	end

  	resources :pages, only: [:show, :index] do
      resources :emotions, only: [:create, :destroy]
  		resources :notes, only: [:edit, :create, :destroy, :update] do
        member do
          post :like
          delete :unlike
        end
        resources :comments, only: [:create]
      end
  	end
  end

  resources :tasks
  devise_for :users

  root to: "pages#today"
end
