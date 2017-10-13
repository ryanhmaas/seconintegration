ActiveAdmin.register Category do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
    permit_params :name, pages_attributes: [:id, :name, :description, :_destroy, :_create, :_update]
# permit_params :list, :of, :attributes, :on, :model
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
            f.input :name

            f.has_many :pages do |page|
                page.input :name
                page.input :description
            end
        end
        f.actions
    end

    show do
        attributes_table do
            row :name
            panel "Pages" do
                table_for category.pages do 
                    column "name" do |page|
                        page.name
                    end
                    column "description" do |page|
                        page.description
                    end
                end
            end #end panel
        end
    end
end
