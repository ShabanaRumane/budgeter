require "application_system_test_case"

class SpendingBudgetsTest < ApplicationSystemTestCase
  setup do
    @spending_budget = spending_budgets(:one)
  end

  test "visiting the index" do
    visit spending_budgets_url
    assert_selector "h1", text: "Spending Budgets"
  end

  test "creating a Spending budget" do
    visit spending_budgets_url
    click_on "New Spending Budget"

    fill_in "Budget classification", with: @spending_budget.budget_classification
    fill_in "Budget classification amount", with: @spending_budget.budget_classification_amount
    fill_in "Budget daily amount", with: @spending_budget.budget_daily_amount
    fill_in "Budget type", with: @spending_budget.budget_type
    fill_in "Category", with: @spending_budget.category
    click_on "Create Spending budget"

    assert_text "Spending budget was successfully created"
    click_on "Back"
  end

  test "updating a Spending budget" do
    visit spending_budgets_url
    click_on "Edit", match: :first

    fill_in "Budget classification", with: @spending_budget.budget_classification
    fill_in "Budget classification amount", with: @spending_budget.budget_classification_amount
    fill_in "Budget daily amount", with: @spending_budget.budget_daily_amount
    fill_in "Budget type", with: @spending_budget.budget_type
    fill_in "Category", with: @spending_budget.category
    click_on "Update Spending budget"

    assert_text "Spending budget was successfully updated"
    click_on "Back"
  end

  test "destroying a Spending budget" do
    visit spending_budgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spending budget was successfully destroyed"
  end
end
