class BookingsController < ApplicationController
  before_action :set_candidacy, only: [:index]

  def index
    @bookings = policy_scope(Booking).where(candidacy_id: @candidacy).order(created_at: :desc)
    @sidebar_title = "#nom_appart_a_recuperer"
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def set_candidacy
    @candidacy = Candidacy.find(params[:candidacy_id])
    # authorize(@candidacy)
  end
end
