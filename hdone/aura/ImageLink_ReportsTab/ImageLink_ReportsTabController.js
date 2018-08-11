({
	handleReportsTabClick : function(component, event, helper) {
		        var navEvt = $A.get("e.force:navigateToObjectHome").setParams({
            "scope": "Report"
        }).fire();
	}
})