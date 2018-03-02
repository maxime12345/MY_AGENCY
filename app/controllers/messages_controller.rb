class MessagesController < ApplicationController
  before_action :set_candidacy, only: [:show, :edit, :update, :destroy]
  before_action :set_flat, only: [:new, :create]

  def index
    @messages = Message.where()
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
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
