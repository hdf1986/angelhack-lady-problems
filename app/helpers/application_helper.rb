module ApplicationHelper
  def msg_class type
    if type == 'marie'
      return 'pink'
    else
      return 'purple lighten-4 talk-to-marie'
    end
  end

   def msg_class2 type
    if type == 'marie'
      return ''
    else
      return 'talk-to-marie'
    end
  end
end
