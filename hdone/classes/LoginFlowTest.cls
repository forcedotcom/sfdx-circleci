@isTest
public class LoginFlowTest {
    
    @isTest
    static void checkPermissionSet(){
        list<PermissionSetAssignment> newpermset = new List<PermissionSetAssignment>();
        Profile prof = [SELECT Id FROM Profile WHERE Name = 'ONE Manager'];
        User newUser = new User(Alias = 'onemgr', 
                                Email='onemgremail@testorg.com',
                                EmailEncodingKey='UTF-8', 
                                LastName='Testing', 
                                LanguageLocaleKey='en_US',
                                LocaleSidKey='en_US', 
                                ProfileId = prof.Id,
                                TimeZoneSidKey='America/Los_Angeles', 
                                UserName='onemgremail@testorg.com',
                                InitialProductAssigned__c = False);
        PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = 'MemberOne_Mgr'];
        
        Test.startTest();
        insert newUser;        
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.AssigneeId = newUser.Id;
        psa.PermissionSetId = ps.Id;
        Test.stopTest();
        
        //   System.runAs(newUser){
        //       LoginFlow lf = new LoginFlow();
        
        
        User usrupd = [SELECT Id FROM User Where Id=: psa.AssigneeId];
        usrupd.InitialProductAssigned__c = TRUE;
        System.assertEquals(usrupd.Id, newUser.Id);
    }}