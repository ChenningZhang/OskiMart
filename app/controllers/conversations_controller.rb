class ConversationsController < ApplicationController
  # this manages a single conversation thread
  before_action :authenticate_user!
  before_action :get_mailbox, except: [:new, :create]
  before_action :get_conversation, except: [:index, :empty_trash, :new, :create]
  before_action :get_box, only: [:index]

  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    redirect_to conversation_path(conversation)
  end

  def index
    if @box.eql? "inbox"
      @conversations = @mailbox.inbox
    elsif @box.eql? "sent"
      @conversations = @mailbox.sentbox
    else
      @conversations = @mailbox.trash
    end
    @conversations = @conversations.paginate(page: params[:page], per_page: 10)
  end

  def show
    @conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to conversation_path(@conversation)
  end

  # 3 methods below: request/response usage unclear. We possibly want to refactor these to respond to ajax calls
  # also note: these methods are purely experimental at this moment. No tests have been written for them
  # USE AT YOUR OWN RISK!
  def destroy
    @conversation.move_to_trash(current_user)
    redirect_to conversations_path
  end

  def restore
    @conversation.untrash(current_user)
    redirect_to conversations_path
  end

  def empty_trash
    @mailbox.trash.each do |conversation|
      conversation.receipts_for(current_user).update_all(deleted: true)
    end
    redirect_to conversations_path
  end

  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  def get_box
    if params[:box].blank? or !["inbox","sent","trash"].include?(params[:box])
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end
end