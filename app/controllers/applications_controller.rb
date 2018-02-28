class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @applications = Application.where(user: current_user).order(created_at: :desc)
    # @flats = policy_scope(Flat).order(created_at: :desc)
    # @wheelies_geo = @wheelies.select{ |wheely| !wheely.latitude.nil? && !wheely.longitude.nil?}

    # @markers = @wheelies_geo.map do |wheely|
    #   {
    #     lat: wheely.latitude,
    #     lng: wheely.longitude,
    #     infoWindow: { content: render_to_string(partial: "/wheelies/map_box", locals: { wheely: wheely }) }
    #   }
  end

  def show
  end

  def new
     @application = Application.new
     authorize(@application)
  end

  def create
    @application = Application.new(application_params)
    authorize(@application)
    @application.user = current_user

    if @application.save
      redirect_to @application, notice: 'Application was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @application.update(application_params)
      redirect_to @application, notice: 'application was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @application.destroy
    redirect_to applications_path, notice: 'Application was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_application
    @application = Application.find(params[:id])
    # authorize(@application)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def application_params
    params.require(:application).permit(:flat_id, :user_id)
  end
end
