Rails.application.routes.draw do
  #rake routesのPrefix部分に_pathを付ければOK
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]

end
