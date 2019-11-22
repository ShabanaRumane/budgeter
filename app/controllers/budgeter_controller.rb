class BudgeterController < ApplicationController
  def index
    @transactions = Transaction.all
  end
end
