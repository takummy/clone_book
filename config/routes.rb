Rails.application.routes.draw do
  root 'home#top'

  resources :users do 
    collection do
     post :confirm
    end
  end
  
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :pictures do
    collection do
      post :confirm
    end
  end
end
