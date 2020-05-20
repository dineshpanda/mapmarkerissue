class AddressesController < ApplicationController
  def index
    @q = Address.ransack(params[:q])
    @addresses = @q.result(:distinct => true).includes(:employee).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@addresses.where.not(:office_addr_latitude => nil)) do |address, marker|
      marker.lat address.office_addr_latitude
      marker.lng address.office_addr_longitude
      marker.infowindow "<h5><a href='/addresses/#{address.id}'>#{address.employee_id}</a></h5><small>#{address.office_addr_formatted_address}</small>"
    end

    render("address_templates/index.html.erb")
  end

  def show
    @address = Address.find(params.fetch("id_to_display"))

    render("address_templates/show.html.erb")
  end

  def new_form
    @address = Address.new

    render("address_templates/new_form.html.erb")
  end

  def create_row
    @address = Address.new

    @address.employee_id = params.fetch("employee_id")
    @address.office_addr = params.fetch("office_addr")

    if @address.valid?
      @address.save

      redirect_back(:fallback_location => "/addresses", :notice => "Address created successfully.")
    else
      render("address_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @address = Address.find(params.fetch("prefill_with_id"))

    render("address_templates/edit_form.html.erb")
  end

  def update_row
    @address = Address.find(params.fetch("id_to_modify"))

    @address.employee_id = params.fetch("employee_id")
    @address.office_addr = params.fetch("office_addr")

    if @address.valid?
      @address.save

      redirect_to("/addresses/#{@address.id}", :notice => "Address updated successfully.")
    else
      render("address_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_employee
    @address = Address.find(params.fetch("id_to_remove"))

    @address.destroy

    redirect_to("/employees/#{@address.employee_id}", notice: "Address deleted successfully.")
  end

  def destroy_row
    @address = Address.find(params.fetch("id_to_remove"))

    @address.destroy

    redirect_to("/addresses", :notice => "Address deleted successfully.")
  end
end
