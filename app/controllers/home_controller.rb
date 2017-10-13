class HomeController < ApplicationController
    before_action :force_json, only: :search

    def index
    end

    def search
        @pages = Page.ransack(name_cont:params[:q]).result(distinct: true).limit(5)
        @categories = Category.ransack(name_cont:params[:q]).result(distinct: true).limit(5)
    end

    private

    def force_json
        request.format = :json
    end
end
