Rails.application.routes.draw do


  resources :users, only: [:search, :show], path: 'profiles' do
  	collection do
  	  get :search
  	  # /profiles/search?q=zah
  	end

  	# mamber do
  	#	get :salam
  	#	# /profiles/1/salam
  	# end


  	resources :pages, only: [:show, :index] do
      resources :emotions, only: [:create]
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

  root to: "pages#index"
end
