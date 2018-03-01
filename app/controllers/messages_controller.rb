class MessagesController < ApplicationController
  before_action :set_candidacy, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.where(candidacy: @candidacy).order(created_at: :desc)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    authorize(@candidacy)
    @message.sender = current_user
    if current_user == @candidacy.user
      @message.recipient = @candidacy.flat.user
    elsif current_user == @candidacy.flat.user
      @message.recipient = @candidacy.user
    end
    if @message.save
      respond_to do |format|
        format.html { redirect_to messages_path(@candidacy) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'messages/show' }
        format.js  # <-- idem
      end
    end
  end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_candidacy
    @candidacy = Candidacy.find(params[:candidacy_id])
    authorize(@candidacy)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:content)
  end
end
