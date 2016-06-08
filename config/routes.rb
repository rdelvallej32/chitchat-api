Rails.application.routes.draw do
  resources :ratings, except: [:new, :edit]
  resources :topics, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  get '/random-show' => 'topics#randomshow'
  get '/show-nyt' => 'topics#shownyt'
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
