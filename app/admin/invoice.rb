ActiveAdmin.register Invoice do
# See permitted parameters documentation:
    permit_params [:photo, :user_id, :applicable_date, :paid]
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.inputs "Attachment", :multipart => true do 
        f.input :photo, :as => :file
      end
      f.input :applicable_date
      f.input :user, label: "Choose a user"
      f.input :paid, as: :select
    end
    f.actions
  end

  index do 
    selectable_column
    column "User", :user
    column "Photo/PDF", :photo
    column "Paid", :paid
    column "Applied Date", :applicable_date
    actions
  end

  show do
    attributes_table do
      row :user
      row :paid
      row :applicable_date
      row :photo do |p|
       image_tag p.photo
      end
    end
  end
end
