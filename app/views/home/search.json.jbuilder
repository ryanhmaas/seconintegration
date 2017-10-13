json.pages do 
    json.array!(@pages) do |page|
        json.name page.name
        json.url page_path(page)
    end
end

json.categories do 
    json.array!(@categories) do |category|
        json.name category.name
        json.url page_path(category)
    end
end