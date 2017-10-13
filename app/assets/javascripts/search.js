document.addEventListener("turbolinks:load", function(){
    var $input = $("[data-behavior='autocomplete']");

    var options = {
        getValue: "name",
        url: function(phrase){
            return "/search.json?q=" + phrase;
        },
        categories: [
            {
                listLocation: "pages",
                header: "Pages"
            },
            {
                listLocation: "categories",
                header: "Categories"
            }
        ],
        list : {
            onChooseEvent: function(){
                //user clicks on item
                var url = $input.getSelectedItemData().url;
                $input.val(""); //clear val
                Turbolinks.visit(url);
            }
        }
    };

    $input.easyAutocomplete(options);
});