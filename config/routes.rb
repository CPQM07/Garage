Rails.application.routes.draw do
  resources :garage_lists, except: [:show] do
    resources :lab_tasks, except: [:index, :show]
  end
  root 'garage_lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
