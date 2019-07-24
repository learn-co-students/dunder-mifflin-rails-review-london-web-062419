class EmployeesController < ApplicationController

    before_action :this_employee, only: [:show, :update, :edit, :destroy]

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def create
        @employee = Employee.create(employee_params)
        redirect_to employees_path
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        redirect_to employees_path
    end
    
    def destroy
        if @employee.destroy
            redirect_to employees_path
        else
            render :edit
        end
    end

    private

    def this_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end