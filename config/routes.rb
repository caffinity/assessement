Rails.application.routes.draw do
  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'teachers#index'
  resources :classrooms 
  resources :students

end
