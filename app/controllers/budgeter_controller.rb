class BudgeterController < ApplicationController
  def index
    @transactions = Transaction.all
    @expenses = Transaction.curr_yr_expense_by_category
  end

  def expense_vs_budget
    
    #SpendingBudget.get_budget_for_daterange(params[:t][:s_date],params[:t][:e_date]).order(:category)
    #@spendingbudget = SpendingBudget.select("category, (budget_daily_amount)  * (DATEDIFF(:e_date, :s_date)+1) as amount" ,{s_date: params[:t][:s_date], e_date: params[:t][:e_date]})
    
    total_days=Date.parse(params[:t][:e_date]) - Date.parse(params[:t][:s_date]) + 1
    @spendingbudget=SpendingBudget.select("category, (budget_daily_amount * " + total_days.to_s + ") as amount").where("budget_type = 'Expense'")

    @transaction=Transaction.select("category, sum(transaction_amount) as amount").where("transaction_type = 'Expense' and transaction_date >= :s_date and transaction_date <= :e_date ", {s_date: params[:t][:s_date], e_date: params[:t][:e_date]}).group("category")

    sb = Hash.new(0.0)
    @spendingbudget.each do |row|
      sb[row.category] = row.amount
    end

    tr = Hash.new(0.0)
    @transaction.each do |row|
      tr[row.category] = row.amount
    end
      
    all_categories = sb.keys | tr.keys
    
    @expense_vs_budget_array = []
    
    all_categories.each do |cat|
      if sb[cat] == 0
        percent = 'NA' 
      else
        percent = "%1.2f" %[100*(sb[cat]-tr[cat])/sb[cat]]
      end
      row = [cat,sb[cat],tr[cat],percent]
      @expense_vs_budget_array.push row
    end
    
    

    
  end


end