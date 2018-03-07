class BookingsController < ApplicationController
  before_action :set_candidacy, only: [:create, :destroy, :update]
  before_action :set_availability, only: [:create, :destroy, :update]

  def index
    if params[:candidacy_id].nil?
      @candidacies = policy_scope(Candidacy).where(user: current_user).order(created_at: :desc)
      @bookings = []
      @candidacies.each do |candidacy|
        @bookings << candidacy.bookings.first unless candidacy.bookings.empty?
      end
      @bookings.sort!{|a,b| b.availability.start_time <=> a.availability.start_time}
    else
      set_candidacy
      @bookings = policy_scope(Booking).where(candidacy_id: @candidacy).order(created_at: :desc)
      @availabilities = policy_scope(Availability).where(candidacy: @candidacy).order(created_at: :desc)
      @today = Date.today
      @flat = @candidacy.flat
      @sidebar_title = @flat.name
      @availabilities = @flat.availabilities
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking = Booking.find_by(candidacy: @candidacy)
    @booking.update(params[:status])
    redirect_to flat_candidacies_path(@candidacy.flat)
  end

  def new
  end

  def create
    @booking = Booking.find_by(candidacy: @candidacy)
    if @booking
      @booking.availability = @availability
    else
      @booking = Booking.new(availability: @availability, candidacy: @candidacy)
    end
    authorize(@booking)
    if @booking.save
      render json: @booking
    else
      render json: @booking.errors, status: :bad_request
    end
    @candidacy.update(status: "Visite programmee")
  end

  def destroy
    @candidacy.update(status: "En attente")
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def set_candidacy
    @candidacy = Candidacy.find(params[:candidacy_id])
    # authorize(@candidacy)
  end

  def set_availability
    @availability = Availability.find(params[:availability_id])
    # authorize(@availability)
  end
end
