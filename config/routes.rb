Rails.application.routes.draw do
  root 'top#index'

  resources :incomes
  resources :fixedcosts
end
