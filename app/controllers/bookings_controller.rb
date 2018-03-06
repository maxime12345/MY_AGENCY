class BookingsController < ApplicationController
  before_action :set_candidacy, only: [:index]
  # before_action :set_availability, only: [:index]

  def index
    @bookings = policy_scope(Booking).where(candidacy_id: @candidacy).order(created_at: :desc)
    @availabilities = policy_scope(Availability).where(candidacy: @candidacy).order(created_at: :desc)
    @today = Date.today
    @flat = @candidacy.flat
    @sidebar_title = @flat.name
    @availabilities = @flat.availabilities
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

  def set_availability
    @availability = Availability.find(params[:flat_id])
    authorize(@availability)
  end
end
