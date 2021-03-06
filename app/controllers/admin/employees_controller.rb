class Admin::EmployeesController < AdminController
  before_action :find_employee, only: [:edit, :update, :show_leave, :leave]
  def index
    @employees = Employee.all.order("status desc")
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.user_id = current_user.id
    @employee.save ? flash_msg(:success) : flash_msg(:error, @employee.error_msg)
    redirect_to action: :index
  end

  def edit
  end

  def update
    @employee.update_attributes(employee_params) ? flash_msg(:success) : flash_msg(:error)
    redirect_to action: :index
  end

  def show_leave
  end

  def leave
    @employee.update_attributes(leave_params) ? flash_msg(:success) : flash_msg(:error) if @employee.status == 1
    redirect_to action: :index
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :mobile, :department, :emergent_person, :emergent_mobile, :salary, :born_at, :join_at )
  end

  def leave_params
    params.require(:employee).permit(:leave_at, :leave_reason, :status)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

end
