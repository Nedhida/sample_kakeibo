Rails.application.routes.draw do
  root 'top#index'
  #トップページから収入金額登録画面へ遷移するためのリンク用
  post "income_values/new(/:name)" => "income_values#new"

  resources :incomes
  resources :fixedcosts
  resources :variablecosts
  resources :income_values
end
