Rails.application.routes.draw do
  devise_for :users

  root 'miniblogs#index'
  resources :miniblogs

end
