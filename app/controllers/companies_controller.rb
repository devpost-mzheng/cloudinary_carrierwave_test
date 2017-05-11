class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company_form = CompanyForm.new(Company.new)
  end

  def edit
    @company_form = CompanyForm.new(@company)
  end

  def create
    @company_form = CompanyForm.new(Company.new)

    if @company_form.validate(company_params)
      @company_form.save

      redirect_to companies_url
    else
      render "new"
    end
  end

  def update
    @company_form = CompanyForm.new(@company)

    # this will delete the logo from cloudinary but keep it on the model if there wasn't a new one uploaded
    # you can reproduce this behavior without the controller by just saving a company as follows:
    #
    # company = Company.last
    # company.logo = company.logo
    # company.save
    #
    if @company_form.validate(company_params)
      @company_form.save

      redirect_to company_url(@company)
    else
      render "edit"
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :logo)
    end
end
