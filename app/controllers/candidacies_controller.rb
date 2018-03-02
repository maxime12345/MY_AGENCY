class CandidaciesController < ApplicationController
  before_action :set_candidacy, only: [:show, :edit, :update, :destroy]
  before_action :set_flat, only: [:new, :create]

  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:flat_id].nil?
      @candidacies = policy_scope(Candidacy).where(user: current_user).order(created_at: :desc)
    else
      set_flat
      @flats = policy_scope(Flat).where(user: @flat.user).order(created_at: :desc)
      @candidacies = policy_scope(Candidacy).where(flat_id: params[:flat_id]).order(created_at: :desc)
    end
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

    if params[:flat_id].nil?
      @messages = policy_scope(Message).where(candidacy: @candidacy).order(created_at: :desc)
    else
      @candidacies = policy_scope(Candidacy).where(flat_id: params[:flat_id]).order(created_at: :desc)
      @messages = policy_scope(Message).where(flat_id: params[:flat_id]).order(created_at: :desc)
    end
    @message = Message.new
    @flat = @candidacy.flat
  end

  def new
   @candidacy = Candidacy.new
   authorize(@candidacy)
  end

  def create
    @candidacy = Candidacy.new(candidacy_params)
    authorize(@candidacy)
    @candidacy.flat = @flat
    @candidacy.user = current_user

    if @candidacy.save
      redirect_to @candidacy, notice: 'Candidacy was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @candidacy.update(candidacy_params)
      redirect_to @candidacy, notice: 'Candidacy was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @candidacy.destroy
    redirect_to candidacys_path, notice: 'Candidacy was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_flat
    @flat = Flat.find(params[:flat_id])
    authorize(@flat)
  end

  def set_candidacy
    @candidacy = Candidacy.find(params[:id])
    authorize(@candidacy)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def candidacy_params
    params.permit(:flat_id, :user_id)
  end
end
