class Admin::AccountsController < AdminController
  before_action :find_account, only: [:change_status]
  def index
    @accounts = Account.all.order("status desc")
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    @account.save ? flash_msg(:success) : flash_msg(:error, @account.error_msg)
    redirect_to action: :index
  end

  def change_status
    if params["status"] == "禁用"
      @account.status = 0
    elsif params["status"] == "启用"
      @account.status = 1
    end
    @account.save ? flash_msg(:success) : flash_msg(:error, @account.error_msg)
    redirect_to action: :index
  end

  private
  def account_params
    params.require(:account).permit(:name, :card_number, :initial_total)
  end

  def find_account
    @account = Account.find(params[:id])
  end

end
