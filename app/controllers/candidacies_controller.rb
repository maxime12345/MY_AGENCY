class CandidaciesController < ApplicationController
  before_action :set_candidacy, only: [:show, :edit, :update, :destroy]
  before_action :set_flat, only: [:new, :create]

  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:flat_id].nil? #Côté locataire: Mes candidatures
      @candidacies = policy_scope(Candidacy).where(user: current_user).order(created_at: :desc)
      @sidebar_title = "Mes candidatures"
      @flats = []
      @candidacies.empty? ? @unread_mess_flat = 0 : count_unread_messages(@candidacies.first.flat)
      @candidacies.each do |candidacy|
        @flats << candidacy.flat
      end
      @flats_geo = @flats.select{ |flat| !flat.latitude.nil? && !flat.longitude.nil?}

      @markers = @flats_geo.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude,
          infoWindow: { content: render_to_string(partial: "/shared/map_box", locals: { flat: flat }) }
        }
      end
    else #Côté propriétaire: Les candidatures par appartement
      set_flat
      count_unread_messages(@flat)
      @flats = policy_scope(Flat).where(user: @flat.user).order(created_at: :desc)
      @candidacies = policy_scope(Candidacy).where(flat_id: params[:flat_id]).order(created_at: :desc)
      sort_candidacies(@candidacies)
    end
  end

  def sort_candidacies(candidacies_tot)
    @candidacies_sorted = []
    @candidacies_sorted << candidacies_tot.where(status: "Dossier retenu").order(updated_at: :desc)
    @candidacies_sorted << candidacies_tot.where(status: "Visite effectuee").order(updated_at: :desc)
    @candidacies_sorted << candidacies_tot.where(status: "Visite programmee").order(updated_at: :desc)
    @candidacies_sorted << candidacies_tot.where(status: "En attente").order(updated_at: :desc)
    @candidacies_sorted << candidacies_tot.where(status: "Dossier archive").order(updated_at: :desc)
  end

  def show
    if params[:flat_id].nil?
      @marker = [{
        lat: @candidacy.flat.latitude,
        lng: @candidacy.flat.longitude,
        infoWindow: { content: render_to_string(partial: "/shared/map_box", locals: { flat: @candidacy.flat }) }
      }]
      @messages = policy_scope(Message).where(candidacy: @candidacy).order(created_at: :desc)
    else
      @candidacies = policy_scope(Candidacy).where(flat_id: params[:flat_id]).order(created_at: :desc)
      @messages = policy_scope(Message).where(flat_id: params[:flat_id]).order(created_at: :desc)
    end
    @message = Message.new
    @flat = @candidacy.flat
    @sidebar_title = @flat.name
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
    redirect_to candidacies_path, notice: 'Candidacy was successfully destroyed.'
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

  def count_unread_messages(flat)
    @unread_mess_flat = 0
    flat.candidacies.each do |candidacy|
      @unread_mess_flat += candidacy.messages.where(read: false).where(recipient: current_user).count
    end
    return @unread_mess_flat
  end
end
