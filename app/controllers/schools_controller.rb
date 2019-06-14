class SchoolsController < ApplicationController
before_action :set_school, only: [:show, :edit, :destroy]
  # GET /schools
    def index
      @schools = School.all
    end
  # GET /schools/1
    def show
    end

  # GET /schools/new
    def new
      @school = School.new
    end

  # GET /schools/edit
    def edit
    end

  # POST /schools
    def create
      @school = School.new(school_params)
      if @school.save
        redirect_to schools_path
      else
        render :new
      end
    end

  # DELETE /schools
  def destroy
    @school.destroy
    redirect_to schools_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:school_id])
    end

    # Only allow a trusted parameter "white list" through.
    def school_params
      params.require(:school).permit(:name, :address, :principal, :capacity, :private_school)
    end

end
