public without sharing class LoginFlow{
@InvocableMethod(label='Login Flow Invocable Class' description='Runs relevant items for Login Flows')

public static list<String> assignPermissionSet (list<PermissionSetAssignment> PermissionSetFromFlow) {
    list<PermissionSetAssignment> newpermset = new List<PermissionSetAssignment>();
        For (PermissionSetAssignment psa : PermissionSetFromFlow){
            newpermset.add(new PermissionSetAssignment(AssigneeId = psa.AssigneeId,
                                                                    PermissionSetId = psa.PermissionSetId)
                          );
            User usrupd = [SELECT Name FROM User Where Id=: psa.AssigneeId];
            usrupd.InitialProductAssigned__c = TRUE;
            
            /* Doing update inside of loop here as couldn't remember how to do this properly
             * Updating user field with product assignment
             * Could not do within Login Flow as some users do not have valid permissions */
             update usrupd;
        }
        System.debug('UserId ' + newpermset.size());  
            insert newpermset;
return null;       
}
}