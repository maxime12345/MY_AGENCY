class AvailabilitiesController < ApplicationController
  before_action :set_flat, only: [:index, :create]
  before_action :set_availability, only: [:destroy]

  def index
    @availabilities = policy_scope(Availability).where(flat: @flat).order(created_at: :desc)
    count_unread_messages(@flat)
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
    @availability.destroy
    authorize(@availability)

    if @availability.destroy
      head :ok
    else
      head :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_flat
    @flat = Flat.find(params[:flat_id])
    authorize(@flat)
  end

  def set_availability
    @availability = Availability.find(params[:id])
    authorize(@availability)
  end

  def availability_params
    params
      .require(:availability)
      .permit(
        :start_time,
        :visit_confirmed
      )
  end

  def count_unread_messages(flat)
    @unread_mess_flat = 0
    flat.candidacies.each do |candidacy|
      @unread_mess_flat += candidacy.messages.where(read: false).where(recipient: current_user).count
    end
    return @unread_mess_flat
  end

end
