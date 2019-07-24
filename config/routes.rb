Rails.application.routes.draw do
  # resources :dogs
  # resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #index 
  get '/dogs', to: 'dogs#index'
  #new
  get "/dogs/new", to: "dogs#new", as: "new_dog"

  #show
  get "/dogs/:id", to: "dogs#show", as: "dog"
  #create
  post "/dogs", to: "dogs#create"
  #edit
  get "/dogs/:id/edit", to: "dogs#edit", as: "edit_dog"
  #update
  patch "/dogs/:id", to: "dogs#update"
  #destroy/delete
  delete "/dogs/:id", to: "dogs#destroy"
  #same again for employees
  #index
  get '/employees', to: 'employees#index'
  #new
  get '/employees/new', to: 'employees#new', as: 'new_employee'
  #show
  get '/employees/:id', to: 'employees#show', as: "employee"
  #create
  post '/employees', to: 'employees#create'
  #edit
  get '/employees/:id/edit', to: 'employees#edit', as: 'edit_employee'
  #update
  patch '/employees/:id', to: 'employees#update'
  #destroy
  delete '/employees/:id', to: 'employees#destroy'
end
