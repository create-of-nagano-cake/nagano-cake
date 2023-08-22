Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions" 
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  
  get 'admin' => 'admin/homes#top'
  get 'customers/information' => 'public/customers#top'
  root to: 'public/homes#top'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
