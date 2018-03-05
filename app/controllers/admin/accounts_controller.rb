class Admin::AccountsController < AdminController
  def index
    @accounts = Account.all
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

  private
  def account_params
    params.require(:account).permit(:name, :card_number, :initial_total)
  end

end
