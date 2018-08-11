public without sharing class InstallScript implements InstallHandler {
    
    public static final String NAMESPACE_PREFIX = 'hdone';
    public static boolean IsRunning { 
        public get {
            if (IsRunning==null) IsRunning = false;
            return IsRunning;
        }
        public set; 
    }
    
    public void onInstall(InstallContext ctx) {
//        IsRunning=true;
//        RefreshPagesInModule(NAMESPACE_PREFIX);
//        IsRunning=false;
    }
    
/*    public static List<skuid__Page__c> RefreshPagesInModule(String module) {
        
        // See if a StaticResource containing new pages for this module yet exists      
        StaticResource sr = [
            select Body
            from StaticResource 
            where Name = :(module + 'Pages')
            and ((NamespacePrefix = NULL) OR (NamespacePrefix = :module))
            limit 1
        ];
        
        // The new Pages for our module that we will be inserting       
        List<skuid__Page__c> newPages
             = (List<skuid__Page__c>) JSON.deserialize(sr.Body.toString(),List<skuid__Page__c>.class);
        List<Schema.SObjectField> layoutFields = new List<Schema.SObjectField>{
            skuid__Page__c.skuid__Layout__c,
            skuid__Page__c.skuid__Layout2__c,
            skuid__Page__c.skuid__Layout3__c,
            skuid__Page__c.skuid__Layout4__c,
            skuid__Page__c.skuid__Layout5__c
        };
        
        for (skuid__Page__c p : newPages) {
            // Get rid of the Ids so that upsert will proceed           
            p.Id = null;
            // Ensure that unused Layout fields are set to null         
            for (Schema.Sobjectfield f : layoutFields) {
            if (p.get(f)==null) p.put(f,null);
            }
        }
        
        // If we have successfully compiled new Pages for this module,        
       // delete the old ones and replace them with the new.        
       if (newPages != null && !newPages.isEmpty()) {
        Schema.SObjectField f = skuid__Page__c.skuid__UniqueId__c;
        List<Database.UpsertResult> cr = Database.upsert(newPages,f,false);
        }   
        return newPages;
    }
 */   
}