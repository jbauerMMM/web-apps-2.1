class CompaniesController < ApplicationController

  def index
    # find all Company rows
    @companies = Company.all
    # render companies/index view
    render({ :template => "companies/index" })
  end

  def show
    # find the Company whose id is in the address
    @company = Company.find_by({ "id" => params["id"] })
    # find its contacts
    @contacts = Contact.where({ "company_id" => @company["id"] })
    # render companies/show view with details about the Company
    render({ :template => "companies/show" })
  end

  def new
    # render companies/new view, the form
    render({ :template => "companies/new" })
  end

  # def create
  #   # start with a new Company
  #   # assign the form's values to the Company's columns
  #   # save the Company row
  #   # redirect the user
  # end

  # def edit
  #   # find the Company
  #   # render companies/edit view, a form filled with its values
  # end

  # def update
  #   # find the Company
  #   # assign the form's values to the Company's columns
  #   # save the Company row
  #   # redirect the user
  # end

  # def destroy
  #   # find the Company
  #   # destroy the Company row
  #   # redirect the user
  # end

end
