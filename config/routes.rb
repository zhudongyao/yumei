Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "admin/home#index"

  namespace :admin do
    root "home#index"

    # 账户管理
    resources :accounts do
      member do
        post :change_status
      end
    end

    # 收支类型管理
    resources :finance_types do
      member do
        post :change_status
      end
    end

    # 员工管理
    resources :employees do
      member do
        get :show_leave
        post :leave
      end
    end

    # 学生管理
    resources :students do
      collection do
        get :new_formal_student
        post :create_formal_student
      end
    end

    # 学费管理
    resources :tuitions do
      collection do
      end
    end


  end

end
