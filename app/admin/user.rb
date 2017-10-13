ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params :email, :password, :password_confirmation, :account_id, :ismaster, invoices_attributes: [:id, :photo, :applicable_date, :_destroy, :_create, :_update]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

  index do 
    selectable_column
    column "Email", :email
    column "Account", :account
    column "Is Master User?", :ismaster
    column "Created At", :created_at
    column "Updated At", :updated_at
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :email
      f.input :password, :required => false
      f.input :password_confirmation, :required => false
      f.input :ismaster, as: :select
      f.input :account_id, as: :select, :collection => Account.all

      f.has_many :invoices do |invoice|
          invoice.input :applicable_date
          invoice.input :photo, :as => :file, :multipart => true
      end
    end
    f.actions
  end


end
