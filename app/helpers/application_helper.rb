module ApplicationHelper
  def msg_class type
    if type == 'marie'
      return 'other'
    else
      return 'self'
    end
  end
end
