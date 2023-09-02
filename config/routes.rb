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
  
  #admin/customersコントローラー
  namespace :admin do
   resources :customers, only: [:index, :show, :edit, :update]
  end
  
  #admin/itemsコントローラー
  namespace :admin do
   resources :items, only: [:index, :new, :create, :edit, :update, :show ]
  end
  
  #public/itemsコントローラー
  scope module: :public do
   resources :items, only: [:index, :show]
  end
  
  #piblic/cart_itemsコントローラー
  #delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  scope module: :public do
   resources :cart_items, only: [:index, :create, :update, :destroy ] do
    collection do
     delete 'destroy_all'
    end
   end 
  end
  
  #public/customersコントローラー
  get 'customers/information' => 'public/customers#show'
  get 'customers/information/edit' => 'public/customers#edit'
  patch 'customers/information/edit' => 'public/customers#update'
  get 'customers/information/confirm' => 'public/customers#confirm'
  patch 'customers/information/unavailable' => 'public/customers#unavailable'
  
  #public/addressesコントローラー
  scope module: :public do
   resources :addresses, only: [:create ,:index, :edit, :update, :destroy]
  end 
  
  #public/homesコントローラー
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
