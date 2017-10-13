ActiveAdmin.register Account do
# See permitted parameters documentation:
 permit_params :name, users_attributes: [:email, :password, :password_confirmation, :id, :ismaster, :_destroy, :_create, :_update]

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
    def display_name
        name
    end


    form do |f|
        f.inputs do
            f.input :name

            f.has_many :users do |page|
                page.input :email
                page.input :password, :required => false
                page.input :password_confirmation
                page.input :ismaster
            end
        end
        f.actions
    end

    index do 
        selectable_column
        column "Name", :name
        column "Created At", :created_at
        column "Updated At", :updated_at
        actions
    end

    show do
        attributes_table do
            row :name
            panel "Users" do
                table_for account.users do 
                    column "Email" do |user|
                        user.email
                    end
                    column "Is Master User?" do |user|
                        user.ismaster
                    end
                end
            end #end panel
        end
    end
end
