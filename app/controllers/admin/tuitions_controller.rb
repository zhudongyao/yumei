class Admin::TuitionsController < AdminController
  before_action :find_tuition, only: [:change_status]

  def new
    @student = Student.find(params[:student_id]) if params[:student_id].present?
    @tuition = Tuition.new
  end

  def create
    @tuition = Tuition.new(tuition_params)
    @tuition.user_id = current_user.id
    @tuition.save ? flash_msg(:success) : flash_msg(:error, @tuition.error_msg)
    redirect_to admin_students_path
  end

  private
  def tuition_params
    params.require(:tuition).permit(:total, :happened_at, :account_id, :employee_id, :student_id)
  end

  def find_tuition
    @tuition = Tuition.find(params[:id])
  end

end
