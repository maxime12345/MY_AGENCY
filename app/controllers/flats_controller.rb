class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @flats = Flat.where(user: current_user).order(created_at: :desc)
    # @flats = policy_scope(Flat).order(created_at: :desc)
    # @wheelies_geo = @wheelies.select{ |wheely| !wheely.latitude.nil? && !wheely.longitude.nil?}

    # @markers = @wheelies_geo.map do |wheely|
    #   {
    #     lat: wheely.latitude,
    #     lng: wheely.longitude,
    #     infoWindow: { content: render_to_string(partial: "/wheelies/map_box", locals: { wheely: wheely }) }
    #   }
    end
  end

  def show
  end

  def new
    @flat = Flat.new
    # authorize(@flat)
  end

  def create
    @flat = Flat.new(flat_params)
    authorize(@flat)
    @flat.user = current_user

    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Flat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, notice: 'Flat was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_flat
    @flat = Flat.find(params[:id])
    # authorize(@flat)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def flat_params
    params.require(:flat).permit(:name, :address, :price, :description, :publication_date, :surface, :nb_rooms, :ad_url, :visit_capacity, :user_id)
  end
end
