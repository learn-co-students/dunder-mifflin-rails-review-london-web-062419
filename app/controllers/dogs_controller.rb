class DogsController < ApplicationController
    # before_action :dog_id only: [:show, :edit, :update, :destroy]

    def index 
        @dogs = Dog.all
    end 

    def new 
        @dog = Dog.new
    end 

    def show 
      @dog = Dog.find(params[:id])
    end

    def create 
        @dog = Dog.find(params[:id])
        @dog = Dog.new(dog_params)
        if @dog.valid?
            @dog.save

        redirect_to dog_path(@dog)

        else 

            render :new
        end 
    end 

    def edit
        @dog = Dog.find(params[:id])
    end 

    def update 
        @dog = Dog.find(params[:id])
        if @dog.update(dog_params)
            redirect_to dog_path(@dog)
        else 

            render :edit
        end 
    end 

    def destroy 
        @dog = Dog.find(params[:id])
        if @dog.destroy 
            redirect_to dogs_path(@dog)
        else 
            render :edit 
        end 
    end 

    private

    # def dog_id
    #     @dog = Dog.find(params[:id])
    # end 

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end 
end 

