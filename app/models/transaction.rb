class Transaction < ApplicationRecord
  require 'csv'
  #require 'activerecord-import/base'
  #require 'activerecord-import/active_record/adapters/mysql_adapter'

  def self.my_import(file)    
    CSV.foreach(file.path, headers:true) do |row|
      Transaction.create({
        :transaction_type => row[0],
        :category => row[1],
        :location => row[2],
        :transaction_date => row[3],
        :transaction_amount => row[4]
      })
    end
  end

  def self.curr_yr_expense_by_category
    # obsolete deprecated!!!!!!!
    # find_by_sql(["SELECT category, sum(transaction_amount) as amount
    #   FROM transactions
    #   WHERE YEAR(transaction_date)= YEAR(CURDATE())
    #   AND transaction_type = 'Expense'
    #   GROUP BY category
    #   ORDER BY amount ASC, category DESC"]
    # ).map do |row|
    #   [
    #     row['category'],
    #     row.amount.to_f
    #   ]
    # end
    Transaction.select("category, sum(transaction_amount) as amount").where("transaction_type = 'Expense' and YEAR(transaction_date)= YEAR(CURDATE()) ").group("category").map do |row|
      [
        row['category'],
        row.amount.to_f
      ]
    end
  end

  def self.get_expense_for_daterange(s_date,e_date)
    Transaction.select("category, sum(transaction_amount) as amount").where("transaction_type = 'Expense' and transaction_date >= :s_date and transaction_date <= :e_date", {s_date: params[:s_date], e_date: params[:e_date]} ).group("category").map do |row|
      [
        row['category'],
        row.amount.to_f
      ]
    end

  end



end
