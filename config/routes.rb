Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions" 
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  
  #admin/homesコントローラー
  get 'admin' => 'admin/homes#top'
  
  #admin/itemsコントローラー
  get 'admin/items' => 'admin/items#index'
  get 'admin/items/new' => 'admin/items#new'
  post 'admin/items' => 'admin/items#create'
  get 'admin/items/:id' => 'admin/items#show'
  get 'admin/items/:id/edit' => 'admin/items#edit'
  patch 'admin/items/:id' => 'admin/items#update'
 
  #public/customersコントローラー
  get 'customers/information' => 'public/customers#show'
  get 'customers/information/edit' => 'public/customers#edit'
  patch 'customers/information/edit' => 'public/customers#update'
  get 'customers/information/confirm' => 'public/customers#confirm'
  patch 'customers/information/unavailable' => 'public/customers#unavailable'
  
  #public/homesコントローラー
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
