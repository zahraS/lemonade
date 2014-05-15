Rails.application.routes.draw do


  resources :users, only: [:show], path: 'profiles' do
  	collection do
  	  get :search
  	end
    
  	member do
      post :follow
      delete :unfollow
      patch :update_profile
  	end

  	resources :pages, only: [:show, :index] do

      collection do
        get :today
      end

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
  resources :birth_dates

  devise_for :users 
  # , :controllers => {:registrations => "registrations"}

  
    root to: "pages#today"

end
