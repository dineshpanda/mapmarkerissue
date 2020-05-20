class EmployeesController < ApplicationController
  def index
    @employees = Employee.page(params[:page]).per(10)

    render("employee_templates/index.html.erb")
  end

  def show
    @employee = Employee.find(params.fetch("id_to_display"))

    render("employee_templates/show.html.erb")
  end
end
