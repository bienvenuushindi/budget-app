class ExpensesController < ApplicationController
  # load_and_authorize_resource
  before_action :set_expense, only: %i[ show edit update destroy ]

  # GET /expenses or /expenses.json
  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses
  end

  # GET /expenses/new
  def new
    @category = Category.find(params[:category_id])
    @expense = Expense.new
  end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(name: expense_params[:name],
                           amount: expense_params[:amount],
                           author: current_user
    )
    expense_params[:category_ids].each do |item|
      @expense.categories << Category.find(item) if item != ""
    end
    # p @expense
    respond_to do |format|
      if @expense.save
        format.html { redirect_to category_expenses_url(params[:category_id]), notice: "Expense was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, category_ids: [])
    # params.require(:wiki).permit(collaborating_user_ids: [], ...)
  end
end
