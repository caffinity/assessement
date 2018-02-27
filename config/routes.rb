Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :pages do
    collection do
      get 'admin'
  end
end

  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  resources :classrooms



  resources :students, shallow: true do
    collection do
        get 'view'
    end
    resources :skill_levels do
      member do
        get 'update_proficiency'
        get 'create_student_achievement'
        get 'destroy_student_achievement'
        get 'student_progress'
        get 'level_up_proficiency'
      end
    end
    resources :student_notes

  end
  resources :subjects, :skills
  resources :proficiency_levels, shallow: true do
    resources :achievements do
      member do
        patch 'student_achievement'
      end

    end
  end
end
