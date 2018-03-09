class Admin::FinancesController < AdminController
  before_action :find_finance, only: []
  def index
    @finances = Finance.all.order("status desc, happened_at desc")
  end

  def new_income
    @finance = Finance.new
  end

  def new_expense
    @finance = Finance.new
  end

  def create
    @finance = Finance.new(finance_params)
    @finance.user_id = current_user.id
    @finance.save ? flash_msg(:success) : flash_msg(:error, @finance.error_msg)
    redirect_to action: :index
  end

  private
  def finance_params
    params.require(:finance).permit(:finance_type_id, :total, :happened_at, :remark, :account_id)
  end

  def find_finance
    @finance = Finance.find(params[:id])
  end

end
