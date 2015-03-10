/**
 * Created by lrlarson on 8/16/14.
 */
(function() {
    "use strict";

    // instantiate widget's object
    window.autocomplete = new AcidJs.AutoComplete({
        //skin: "Windows7", // {String} [optional] default: "Windows7"
        //appRoot: "path/to/widget/" {String} [optional] path to the AcidJs.AutoComplete folder, default: ""
        //search: "fuzzy" // {String} [optional] type of search "exact" exact match in the beginning of the entry or "fuzzy" - any match, default: "exact"
    });

    window.autocomplete.enable({
        input: $("#toneSetData"),
        //sort: false,
        data: [


        ]
    });

});