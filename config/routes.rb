Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :product_details do
    resources :comments
  end
  root 'product#index'
end
