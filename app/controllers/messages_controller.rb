class MessagesController < ApplicationController
  before_action :set_candidacy, only: [:show, :create, :edit, :update, :destroy]

  def index
    if params[:flat_id].nil?
      set_chat_page
      @sidebar_title = @flat.name
    else
      if params[:candidacy_id].nil?
        set_flat
        @flats = policy_scope(Flat).where(user: @flat.user).order(created_at: :desc)
        @candidacies = policy_scope(Candidacy).where(flat_id: params[:flat_id]).order(created_at: :desc)
        create_discussions
      else
        set_chat_page
      end
    end
    @message = Message.new
  end

  def set_chat_page
    set_candidacy
    count_unread_messages(@candidacy.flat)
    @messages = policy_scope(Message).where(candidacy: @candidacy).order(created_at: :desc)
    check_unread_message(@messages)
    unread_to_read
    @flat = @candidacy.flat
    @flats = policy_scope(Flat).where(user: @flat.user).order(created_at: :desc)
  end


  def create_discussions
    @discussions = []
    @candidacies.each do |candidacy|
      if !policy_scope(Message).where(candidacy: candidacy).order(created_at: :desc).empty?
        @messages = policy_scope(Message).where(candidacy: candidacy).order(created_at: :desc)
        @discussions << [@messages, check_unread_message(@messages)]
      end
    end
    @discussions.sort!{|a,b| b.first.first.updated_at <=> a.first.first.updated_at}
    @candidacies.empty? ? @unread_mess_flat = 0 : count_unread_messages(@candidacies.first.flat)
  end

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

  def check_unread_message(messages_list)
    @unread_messages = messages_list.select { |message| !message.read && message.recipient == current_user}
  end

  def unread_to_read
    @unread_messages.each do |message|
      message.update(read: true)
    end
  end

  def count_unread_messages(flat)
    @unread_mess_flat = 0
    flat.candidacies.each do |candidacy|
      @unread_mess_flat += candidacy.messages.where(read: false).where(recipient: current_user).count
    end
    return @unread_mess_flat
  end
end
