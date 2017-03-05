({
    
    doInit : function(component, event, helper) 
    {   
        var action = component.get("c.getContacts");
        
        action.setCallback(this, function(a){
            component.set("v.contacts", a.getReturnValue());
        });
        
        $A.enqueueAction(action);
        
    }
})