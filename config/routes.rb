Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "addresses#index"
  # Routes for the Address resource:

  # CREATE
  get("/addresses/new", { :controller => "addresses", :action => "new_form" })
  post("/create_address", { :controller => "addresses", :action => "create_row" })

  # READ
  get("/addresses", { :controller => "addresses", :action => "index" })
  get("/addresses/:id_to_display", { :controller => "addresses", :action => "show" })

  # UPDATE
  get("/addresses/:prefill_with_id/edit", { :controller => "addresses", :action => "edit_form" })
  post("/update_address/:id_to_modify", { :controller => "addresses", :action => "update_row" })

  # DELETE
  get("/delete_address/:id_to_remove", { :controller => "addresses", :action => "destroy_row" })
  get("/delete_address_from_employee/:id_to_remove", { :controller => "addresses", :action => "destroy_row_from_employee" })

  #------------------------------

  devise_for :employees
  # Routes for the Employee resource:

  # READ
  get("/employees", { :controller => "employees", :action => "index" })
  get("/employees/:id_to_display", { :controller => "employees", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
