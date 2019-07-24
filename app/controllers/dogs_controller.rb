class DogsController < ApplicationController

    def index
        @dog = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new
    end

    def create
       dog = Dog.new(dog_params)
       if dog.save
        redirect_to dog_path(dog)
       else
        redirect_to new_dog_path
       end

    end

    #strong params

    private
    def dog_params
        params.require(:dog).permit(:name, :age, :breed)
    end

end
