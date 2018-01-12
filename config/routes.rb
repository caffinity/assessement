Rails.application.routes.draw do
  resources :pages
  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  resources :classrooms

  resources :students, shallow: true do
    resources :skill_levels
  end
  resources :subjects, :skills
  resources :proficiency_levels, shallow: true do
    resources :achievements
  end 
end
