module PicturesHelper
  def new_or_edit_pictures
    if action_name == 'new' || action_name == 'confirm'
      confirm_pictures_path
    elsif action_name == 'edit'
      picture_path
    end
  end

  def correct_owner?
    picture = Picture.find(params[:id])
    picture.user_id == current_user.id
  end
end
