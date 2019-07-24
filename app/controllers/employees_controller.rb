class EmployeesController < ApplicationController

    def index
        @employee = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
    end

    def create
        employee = Employee.new(employee_params)
        if employee.valid?
            employee.save
            redirect_to employee_path(employee)
        else
            flash[:errors] = employee.errors.full_messages
            redirect_to new_employee_path
        end
     end

     def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            flash[:errors] = @employee.errors.full_messages
            render :edit
        end
    end

     def destroy
        @employee = Employee.find(params[:id])
        if @employee.destroy
            redirect_to employees_path
        else
            render :edit
        end
     end

     def edit    
        @employee = Employee.find(params[:id])
     end

     private
     def employee_params
         params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
     end

end
