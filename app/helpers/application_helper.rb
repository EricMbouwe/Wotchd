module ApplicationHelper

  def set_user_avatar(obj)
    if obj.avatar.attached? 
      image_tag obj.avatar, class: "mt-5 rounded-circle avatar", width: 90, height: 90 
    else 
      image_tag 'sample-profile2.png', alt: "default image", width: 90, height: 90, class: "rounded-circle mt-5" 
    end 
  end

  def set_program_item(obj)
    if obj
      set_group_icon(obj)
    end
  end

  private

  def set_group_icon(obj)
    if obj.avatar.attached?
      image_tag obj.avatar, class: "avatar", width: 70, height: 70
    else
      image_tag 'sample-group.jpg', alt: "default image", width: 70, height: 70, class: ""
    end
  end
end
