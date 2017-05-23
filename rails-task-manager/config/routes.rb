Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tasks # this is instead of the below code!

  # GET "tasks", to: tasks#index
  # GET "tasks", to: tasks#new
  # POST "tasks", to: tasks#create
  # GET "tasks/:id/edit", to: tasks#edit
  # PATCH "tasks", to: tasks#update
  # GET "tasks/:id", to: tasks#show
  # DELETE "tasks/:id", to: tasks#destroy

end
