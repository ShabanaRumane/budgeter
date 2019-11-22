Rails.application.routes.draw do
  root 'budgeter#index', as: 'budgeter_index'
  # get 'transactions/trans'
  get 'spending_budgets/import' => 'spending_budgets#my_import'
  resources :spending_budgets do
    collection {post :import}
  end
  #resources :transactions

  resources :transactions do
    collection do
      get 'search'
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
