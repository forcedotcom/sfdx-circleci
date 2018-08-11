/* navToController.js */
({
    handleConfirmationPageClick: function (component, event, helper) {
        var navEvt = $A.get("e.force:navigateToURL").setParams({
            "url": "/apex/skuid__ui?page=ConfirmationPage"
        }).fire();
    }
})