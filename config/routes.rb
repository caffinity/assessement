Rails.application.routes.draw do
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
      end
    end

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
