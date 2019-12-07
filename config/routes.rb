Rails.application.routes.draw do
  resources :users
  root 'budgeter#index', as: 'budgeter_index'
  # get 'transactions/trans'
  get 'expense_vs_budget', to: 'budgeter#expense_vs_budget'
  get 'transactions/import' => 'transactions#my_import'
  get 'spending_budgets/import' => 'spending_budgets#my_import'
  
  resources :spending_budgets do
    collection {post :import}
  end
  #resources :transactions

  resources :transactions do
    collection do
      get 'report_with_daterange'
      post :import
    end
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
