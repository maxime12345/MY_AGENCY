class AvailabilitiesController < ApplicationController
  before_action :set_flat, only: [:index]

  def index
    @availabilities = policy_scope(Availability).where(candidacy_id: @candidacy).order(created_at: :desc)
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
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_flat
    @flat = Flat.find(params[:flat_id])
    authorize(@flat)
  end
end
