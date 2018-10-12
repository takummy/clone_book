Rails.application.routes.draw do
  root 'home#top'
  resources :users do 
    collection do
     post :confirm
    end
  end
end
