module PicturesHelper
  def new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_picture_path
    elsif action_name == 'edit'
      picture_path
    end
  end
end
