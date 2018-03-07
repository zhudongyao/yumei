class Admin::EmployeesController < AdminController
  before_action :find_employee, only: [:change_status]
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

  def change_status
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :mobile, :department, :emergent_person, :emergent_mobile, :salary, :born_at, :join_at )
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

end
