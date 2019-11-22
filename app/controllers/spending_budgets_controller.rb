class SpendingBudgetsController < ApplicationController
  before_action :set_spending_budget, only: [:show, :edit, :update, :destroy]

  # GET /spending_budgets
  # GET /spending_budgets.json
  def index
    @spending_budgets = SpendingBudget.all
  end

  def import
    SpendingBudget.my_import(params[:file])
    #my_import(params[:file],current_user.id)
    redirect_to budgeter_index_url, notice: "Successfully Imported Data!!!"
  end
  # GET /spending_budgets/1
  # GET /spending_budgets/1.json
  def show
  end

  # GET /spending_budgets/new
  def new
    @spending_budget = SpendingBudget.new
  end

  # GET /spending_budgets/1/edit
  def edit
  end

  # POST /spending_budgets
  # POST /spending_budgets.json
  def create
    @spending_budget = SpendingBudget.new(spending_budget_params)

    # set_daily_budget
    respond_to do |format|
      if @spending_budget.save
        format.html { redirect_to @spending_budget, notice: 'Spending budget was successfully created.' }
        format.json { render :show, status: :created, location: @spending_budget }
      else
        format.html { render :new }
        format.json { render json: @spending_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spending_budgets/1
  # PATCH/PUT /spending_budgets/1.json
  def update
    respond_to do |format|
      if @spending_budget.update(spending_budget_params)
        format.html { redirect_to @spending_budget, notice: 'Spending budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @spending_budget }
      else
        format.html { render :edit }
        format.json { render json: @spending_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spending_budgets/1
  # DELETE /spending_budgets/1.json
  def destroy
    @spending_budget.destroy
    respond_to do |format|
      format.html { redirect_to spending_budgets_url, notice: 'Spending budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spending_budget
      @spending_budget = SpendingBudget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spending_budget_params
      params.require(:spending_budget).permit(:budget_type, :category, :budget_classification, :budget_classification_amount, :budget_daily_amount)
    end
    

end
