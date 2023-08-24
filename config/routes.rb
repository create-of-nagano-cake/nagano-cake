Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions" 
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  
  get 'admin' => 'admin/homes#top'
  
  get 'customers/information' => 'public/customers#show'
  get 'customers/information/edit' => 'public/customers#edit'
  patch 'customers/information/edit' => 'public/customers#update'
  get 'customers/information/confirm' => 'public/customers#confirm'
  patch 'customers/information/unavailable' => 'public/customers#unavailable'
  
  root to: 'public/homes#top'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
