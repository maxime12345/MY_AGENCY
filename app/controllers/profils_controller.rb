class ProfilsController < ApplicationController
  before_action :set_profil, only: [:show, :edit, :update]

  def edit
  end

  def update
    if @profil.update(profil_params)
      confirm_profil
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
  def profil_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :id_card, :profil_confirmed, :tax_notice, :payslip, :avatar, :address)
  end

  def confirm_profil
    if (!profil_params[:id_card].nil? || @profil.id_card?) && (!profil_params[:tax_notice].nil? || @profil.tax_notice?) && (!profil_params[:payslip].nil? || @profil.payslip?)
      @profil.update(profil_confirmed: true)
    else
      @profil.update(profil_confirmed: false)
    end
  end
end
