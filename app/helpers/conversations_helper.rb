module ConversationsHelper

  def mailbox_section(title, current_box, opts = {})
    opts[:class] = opts.fetch(:class, '')
    opts[:class] += ' active' if title.downcase == current_box
    content_tag :li, link_to(title.capitalize, conversations_path(box: title.downcase)), opts
  end

  def recipients_options(chosen_recipient = nil)
    s = ''
    User.where.not(id: current_user.id).each do |user|
      s << "<option value='#{user.id}' data-img-src='#{gravatar_image_url(user.email, size: 50)}' #{'selected' if user == chosen_recipient}>#{user.first_name + ' ' + user.last_name}</option>"
      #s << "<option value='#{user.id}'>#{user.name}</option>"
    end
    s.html_safe
  end

  def participants(participants = [])
    s = ''
    participants.delete(current_user)
    participants.each do |participant|
      s += participant.full_name + ", "
    end
    s = s[0..s.length-3]
    s.html_safe
  end
end
