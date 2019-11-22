class SpendingBudget < ApplicationRecord

  before_save :set_daily_budget

  require 'csv'
  #require 'activerecord-import/base'
  #require 'activerecord-import/active_record/adapters/mysql_adapter'

  def self.my_import(file)    
    CSV.foreach(file.path, headers:true) do |row|
      SpendingBudget.create({
        :budget_type => row[0],
        :category => row[1],
        :budget_classification => row[2],
        :budget_classification_amount => row[3]
      })
    end
  end


  def set_daily_budget
    case self.budget_classification
    when 'Yearly'
      self.budget_daily_amount = self.budget_classification_amount.to_f/365.0
    when 'Monthly'
      self.budget_daily_amount = self.budget_classification_amount.to_f/30.0
    when 'Quarterly'
      self.budget_daily_amount = self.budget_classification_amount.to_f/90.0
    when 'Weekly'
      self.budget_daily_amount = self.budget_classification_amount.to_f/7.0
    else
      self.budget_daily_amount = self.budget_classification_amount
    end

  end


end