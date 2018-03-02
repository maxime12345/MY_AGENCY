class MessagesController < ApplicationController
  before_action :set_candidacy, only: [:show, :create, :edit, :update, :destroy]

  def index
    if params[:flat_id].nil?
      set_candidacy
      @messages = policy_scope(Message).where(candidacy: @candidacy).order(created_at: :desc)
    else
      @candidacies = policy_scope(Candidacy).where(flat_id: params[:flat_id]).order(created_at: :desc)
      @messages = policy_scope(Message).where(flat_id: params[:flat_id]).order(created_at: :desc)
    end
    @message = Message.new
  end

  # def new
  #   @message = Message.new
  #   authorize(@message)
  # end

  def create
    @message = Message.new(message_params)
    @message.candidacy = @candidacy
    @message.sender = current_user
    if current_user == @candidacy.user
      @message.recipient = @candidacy.flat.user
    elsif current_user == @candidacy.flat.user
      @message.recipient = @candidacy.user
    end
    if @message.save
      respond_to do |format|
        format.html { redirect_to candidacy_messages_path(@candidacy) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'messages/index' }
        format.js  # <-- idem
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
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:content)
  end
end
