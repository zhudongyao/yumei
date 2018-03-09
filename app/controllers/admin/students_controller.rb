class Admin::StudentsController < AdminController
  before_action :find_student, only: [:edit, :update]
  def index
    @students = Student.all.order("status desc").page(params[:page]).per(1)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.user_id = current_user.id
    @student.status = "意向学员"
    @student.save ? flash_msg(:success) : flash_msg(:error, @student.error_msg)
    redirect_to action: :index
  end

  def edit
  end

  def update
    @student.update_attributes(student_params) ? flash_msg(:success) : flash_msg(:error)
    redirect_to action: :index
  end

  def new_formal_student
    @student = Student.new
  end

  def create_formal_student
    ActiveRecord::Base.transaction do
      @student = Student.new(student_params)
      @student.user_id = current_user.id
      @student.save
      @student.tuitions.create(total: params[:total].to_f, happened_at: params[:happened_at], remark: params[:remark], account_id: params[:account_id].to_i, employee_id: params[:employee_id].to_i, user_id: current_user.id)
      flash_msg(:success)
      return redirect_to action: :index
    end
    flash_msg(:error)
    return redirect_to action: :index
  end

  private
  def student_params
    params.require(:student).permit(:name, :born_at, :parent_name, :mobile, :address, :remark)
  end

  def find_student
    @student = Student.find(params[:id])
  end

end
