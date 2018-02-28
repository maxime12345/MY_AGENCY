class ProfilsController < ApplicationController
  before_action :set_profil, only: [:show, :edit, :update]

  def edit
  end

  def update
    if @profil.update(profil_params)
      redirect_to profil_path(current_user), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_profil
    @profil = User.find(params[:id])
    authorize(@profil)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def flat_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :ID_card, :tax_notice, :payslip, :avatar, :address)
  end
end
