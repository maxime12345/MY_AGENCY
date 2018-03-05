class MessagesController < ApplicationController
  before_action :set_candidacy, only: [:show, :create, :edit, :update, :destroy]

  def index
    if params[:flat_id].nil?
      set_candidacy
      @messages = policy_scope(Message).where(candidacy: @candidacy).order(created_at: :asc)
      @flat = @candidacy.flat
      @flats = policy_scope(Flat).where(user: @flat.user).order(created_at: :desc)
    else
      if params[:candidacy_id].nil?
        set_flat
        @flats = policy_scope(Flat).where(user: @flat.user).order(created_at: :desc)
        @discussions = []
        @candidacies = policy_scope(Candidacy).where(flat_id: params[:flat_id]).order(created_at: :desc)
        @candidacies.each do |candidacy|
          if !policy_scope(Message).where(candidacy: candidacy).order(created_at: :desc).empty?
            @discussions << policy_scope(Message).where(candidacy: candidacy).order(created_at: :asc)
          end
        end
        @discussions.sort!{|a,b| b.last.updated_at <=> a.last.updated_at}
      else
        set_candidacy
        @messages = policy_scope(Message).where(candidacy: @candidacy).order(created_at: :asc)
        @flat = @candidacy.flat
        @flats = policy_scope(Flat).where(user: @flat.user).order(created_at: :desc)
      end
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
    authorize(@message)
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
  def set_flat
    @flat = Flat.find(params[:flat_id])
    authorize(@flat)
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_candidacy
    @candidacy = Candidacy.find(params[:candidacy_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:content)
  end
end
