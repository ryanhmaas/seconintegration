ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params [:email, :password, :password_confirmation, :account_id, :ismaster] 
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


form do |f|
    f.inputs do
      f.input :email
      f.input :password, :required => false
      f.input :password_confirmation, :required => false
      f.input :ismaster, as: :select
      f.input :account_id, as: :select, :collection => Account.all
    end
    f.actions
  end

end
