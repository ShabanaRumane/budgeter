require 'test_helper'

class SpendingBudgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spending_budget = spending_budgets(:one)
  end

  test "should get index" do
    get spending_budgets_url
    assert_response :success
  end

  test "should get new" do
    get new_spending_budget_url
    assert_response :success
  end

  test "should create spending_budget" do
    assert_difference('SpendingBudget.count') do
      post spending_budgets_url, params: { spending_budget: { budget_classification: @spending_budget.budget_classification, budget_classification_amount: @spending_budget.budget_classification_amount, budget_daily_amount: @spending_budget.budget_daily_amount, budget_type: @spending_budget.budget_type, category: @spending_budget.category } }
    end

    assert_redirected_to spending_budget_url(SpendingBudget.last)
  end

  test "should show spending_budget" do
    get spending_budget_url(@spending_budget)
    assert_response :success
  end

  test "should get edit" do
    get edit_spending_budget_url(@spending_budget)
    assert_response :success
  end

  test "should update spending_budget" do
    patch spending_budget_url(@spending_budget), params: { spending_budget: { budget_classification: @spending_budget.budget_classification, budget_classification_amount: @spending_budget.budget_classification_amount, budget_daily_amount: @spending_budget.budget_daily_amount, budget_type: @spending_budget.budget_type, category: @spending_budget.category } }
    assert_redirected_to spending_budget_url(@spending_budget)
  end

  test "should destroy spending_budget" do
    assert_difference('SpendingBudget.count', -1) do
      delete spending_budget_url(@spending_budget)
    end

    assert_redirected_to spending_budgets_url
  end
end
