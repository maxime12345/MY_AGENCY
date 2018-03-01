class ProfilsController < ApplicationController
  before_action :set_profil, only: [:show, :edit, :update]

  def edit
  end

  def update
    if @profil.id_card? && @profil.tax_notice? && @profil.payslip?
      @profil.update(profil_confirmed: true)
    else
      @profil.update(profil_confirmed: false)
    end
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
    @profil = current_user
    authorize(@profil)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def profil_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :id_card, :tax_notice, :payslip, :avatar, :address)
  end
end
