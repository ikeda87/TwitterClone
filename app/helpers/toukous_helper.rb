module ToukousHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_toukous_path
    elsif action_name == 'edit'
      toukou_path
    end
  end
end


# module ToukousHelper
#   def choose_new_or_edit
#     if action_name == 'new' || action_name == 'confirm' || action_name == 'create' ||action_name == 'edit'
#       confirm_toukous_path
#     end
#   end
# end
