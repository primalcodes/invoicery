Rails.application.routes.draw do
  resources :payment_terms
  resources :invoices do
    member do
      patch '/toggle_status', to: 'invoices#toggle_status', as: 'toggle_status'
    end
    resources :addresses
    resources :line_items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
