Rails.application.routes.draw do
  devise_for :employees
  # Routes for the Employee resource:

  # READ
  get("/employees", { :controller => "employees", :action => "index" })
  get("/employees/:id_to_display", { :controller => "employees", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
