Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'appointments#index'
  get 'detail' => 'appointments#detail'
  get 'account' => 'pages#account'
  resource :appointments
end
