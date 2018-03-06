class Admin::FinanceTypesController < AdminController
  before_action :find_finance_type, only: [:change_status]
  def index
    @finance_types = FinanceType.all.order("status desc, kind desc")
  end

  def new
    @finance_type = FinanceType.new
  end

  def create
    @finance_type = FinanceType.new(finance_type_params)
    @finance_type.user_id = current_user.id
    @finance_type.save ? flash_msg(:success) : flash_msg(:error, @finance_type.error_msg)
    redirect_to action: :index
  end

  def change_status
    if params["status"] == "禁用"
      @finance_type.status = 0
    elsif params["status"] == "启用"
      @finance_type.status = 1
    end
    @finance_type.save ? flash_msg(:success) : flash_msg(:error, @finance_type.error_msg)
    redirect_to action: :index
  end

  private
  def finance_type_params
    params.require(:finance_type).permit(:name, :kind)
  end

  def find_finance_type
    @finance_type = FinanceType.find(params[:id])
  end

end
