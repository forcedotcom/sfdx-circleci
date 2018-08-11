/* Tests post install script
*/

@isTest
Public class InstallScriptTest{
    static testmethod void testInstallScript() {
        PostInstallationscript postinstall = new PostInstallationscript();
        Test.testInstall(postinstall, null);
        
      Test.startTest(); 
       
      // Load up our controller
      InstallScript ctl = new InstallScript();
      // Test our install with a null version
      Test.testInstall(ctl, null);
   
      Test.stopTest();       
       
/*      List<skuid__Page__c> pages = [
        select id, name 
        from skuid__Page__c 
        where skuid__Module__c = :InstallScript.NAMESPACE_PREFIX
      ];
   
      System.assert(!pages.isEmpty());
      
    }
    
    private static testMethod void PageTrigger_PreventProtectedPageModifications() {
      // Simulate Dev mode code,
      // where it should be possible to modify pages in our module
      InstallScript_ONE.IsRunning = true;
        
      skuid__Page__c test1 = new skuid__Page__c(
        Name = 'UnitTest123'+Datetime.now().getTime(),
        skuid__Module__c = InstallScript.NAMESPACE_PREFIX,
          skuid__Layout__c = '<skuidpage/>'
      );
      insert test1;
   
      // Simulate PRODUCTION code,
      // where it should NOT be possible to modify pages in our module
      InstallScript_ONE.IsRunning = false;
        
      skuid__Page__c test2 = new skuid__Page__c(
        Name = 'UnitTest234'+Datetime.now().getTime(),
        skuid__Module__c = InstallScript.NAMESPACE_PREFIX,
          skuid__Layout__c = '<skuidpage/>'
      );
      Exception exCaught;
      try {
        insert test2;      
      } catch (Exception ex) {
          exCaught = ex;
      }
      System.assertNotEquals(null,exCaught);
 */     
    }    
   
}