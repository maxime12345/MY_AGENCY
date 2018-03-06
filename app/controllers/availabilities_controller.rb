class AvailabilitiesController < ApplicationController
  before_action :set_flat, only: [:index, :create]

  def index
    @availabilities = policy_scope(Availability).where(flat: @flat).order(created_at: :desc)
    @flats = policy_scope(Flat).where(user: @flat.user).order(created_at: :desc)
    @today = Date.today
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
    p "-------------"
    p params
    p "-------------"
    p availability_params
    p "-------------"


    @availability = Availability.new(availability_params)
    @availability.flat = @flat
    authorize(@availability)

    if @availability.save
      render json: @availability
    else
      head :bad_request
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_flat
    @flat = Flat.find(params[:flat_id])
    authorize(@flat)
  end

  def availability_params
    params
      .require(:availability)
      .permit(
        :start_time,
        :visit_confirmed
      )
  end

end
