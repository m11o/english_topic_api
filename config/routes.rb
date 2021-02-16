Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :topics, only: %i[show create]
  resources :topic_histories, only: %i[index create]
end
