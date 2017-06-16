class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    Department.create(department_params)
    flash[:notice] = "Department successfully created =)"
    redirect_to departments_path
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    @department.update_attributes(department_params)
    flash[:notice] = "Department was successfully updated =)"
    redirect_to departments_path
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    flash[:notice] = "Department was successfully deleted =)"
    redirect_to departments_path
  end

  private
    def department_params
      params.require(:department).permit(:title, :description)
    end
    
end
