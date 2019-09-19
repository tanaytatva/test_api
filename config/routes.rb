Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :questions, except: [:show, :new] do
    collection do
      get :mapping_index
      get :role_index
    end
  end
end
