@isTest
public class TestFactory {
    
    // Build Identifier
    public static Identifier__c buildIdentifier(String testingtype, String idvalue) {
        Identifier__c testidentifier = new Identifier__c();
        testidentifier.Value__c = idvalue;
        testidentifier.Type__c = testingtype;
        return testidentifier;
    }
    //Create 200 Schedule Connections
    @isTest
    public static List<Schedule__c> createSchedules(){
        
        Integer schcount = 1;
       // try{ 
            //Create list of 200 bulk Schedules
            List<Schedule__c> testschedules = Test.loadData(Schedule__c.sObjectType, 'testSchedules');
            System.assertEquals(testschedules.size(),200);
            If (testschedules.isEmpty() == False){
                return testschedules;    
                System.debug('Schedule List size is '+testschedules.size());
            } else{
                System.debug('Schedule list is empty.');
                return null;
            }
        //} catch (ListException e){
       // }
        return null;
    }
    
    
    //Create 200 Schedules
    @isTest
    public static List<Schedule__c> createBulkSchedules(){
        
        //Create list of 200 bulk AddressTypes. Needed to create schedules
      //  try{            
            List<Schedule_Connection__c> testschconn = createBulkScheduleConnections();
            System.assertEquals(testschconn.size(),200);
            
            If (testschconn.isEmpty() == False){
                insert testschconn;
                List<Schedule__c> testbulksch = new List<Schedule__c>();
                List<String> daysList = new List <String>();
                List<date> dates = new List <date>();
                
                If (testschconn.size() + Limits.getDMLRows() > Limits.getLimitDMLRows()){
                    System.debug('Need to stop processing to avoid hitting a governor limit. Too many Schedule Connection items to update in this trigger');
                    System.debug('Trying to update ' + testschconn.size() + ' Schedule Connection items but governor limits will only allow ' +  Limits.getLimitDMLRows());
                    
                    For (Schedule_Connection__c schconn : testschconn)
                        schconn.addError('You are attempting to update too many Schedule Connection items at once. Please try again with fewer records.');
                }else
                {
                    System.debug('Continue processing. Not going to hit governor limits for Schedule Connection records');
                    System.debug('Going to update ' + testschconn.size() + ' Schedule Connection items and governor limits will allow ' + Limits.getLimitDMLRows());
                    
                    For (Schedule_Connection__c s : testschconn) {
                        daysList.clear();   // Start new list of days
                        dates.clear();      // Clear dates List
                        //**Not working     daysList.addall(s.Schedule_Development__r.Scheduled_Days__c.split(';')); // Splits multi select picklist for days
                        // Add all multi select picklist days
                        For (String day:daysList){
                            //    dates.addall(myDateClass.getMyDates(day,s.Schedule_Development__r.MonthNumber__c.intvalue(),s.Schedule_Development__r.YearNumber__c.intvalue()));
                        }
                        
                        // Check Apex limits before processing
                        If (dates.size() + Limits.getDMLRows() > Limits.getLimitDMLRows()){
                            System.debug('Need to stop processing to avoid hitting a governor limit. Too many Date items to update in this trigger');
                            System.debug('Trying to update ' + dates.size() + ' Date items but governor limits will only allow ' +  Limits.getLimitDMLRows());
                            
                            For(date d:dates)
                                s.addError('You are attempting to update too many Date items at once. Please try again with fewer records.');
                        }else
                        {
                            System.debug('Continue processing. Not going to hit governor limits for date records');
                            System.debug('Going to update ' + dates.size() + ' date items and governor limits will allow ' + Limits.getLimitDMLRows());
                            
                            For(date d:dates){
                                testbulksch.add(new Schedule__c(
                                    Address_Type__c = s.Address_Type__c,
                                    Start_Time__c = s.Schedule_Development__r.Start_Time__c,
                                    End_Time__c = s.Schedule_Development__r.End_Time__c,
                                    Start_Date__c = d));
                            }
                        }
                    }
                    System.debug(Logginglevel.ERROR, 'Number of schedules created ' + testbulksch.size());
                    return testbulksch;
                    System.debug('Final number of script statements used so far : ' + Limits.getDMLStatements());
                    System.debug('Final heap size: ' + Limits.getHeapSize());
                }
            } else{
                System.debug('Error list is empty.');
                return null;
            }
        //}catch (ListException e){
        //}
        return null;
    }
    
    
    //Create 200 Schedule Connections
    @isTest
    public static List<Schedule_Connection__c> createBulkScheduleConnections(){
        
        Integer schcount = 1;
        String prodname = 'MemberOne';
       // try{ 
            //Create list of 200 bulk AddressTypes
            List<Address_Type__c> testbulkaddrtypes = createBulkAddressType();
            System.assertEquals(testbulkaddrtypes.size(),200);
            
            //Create list of 200 bulk Schedule Development records
            List<Schedule_Development__c> testbulkschdev = createBulkScheduleDevelopment();
            System.assertEquals(testbulkschdev.size(),200);
            
            //Create list of 200 Audit Setting Records
            List<AuditSetting__c> testbulkaudset = createBulkAuditSetting();
            System.assertEquals(testbulkaudset.size(),200);
            
            If (testbulkaddrtypes.isEmpty() == False &&
                testbulkschdev.isEmpty() == False){
                    List<Schedule_Connection__c> testbulkschconn = new List<Schedule_Connection__c>();
                    For (Integer I = 0 ; I < testbulkaddrtypes.size(); I++){
                        testbulkschconn.add(new Schedule_Connection__c(Address_Type__c = testbulkaddrtypes.get(I).id,
                                                                       Schedule_Development__c = testbulkschdev.get(I).id,
                                                                       AuditSetting__c = testbulkaudset.get(I).id,
                                                                       Product_Name__c = prodname
                                                                      ));
                    }
                    return testbulkschconn;    
                    System.debug('Bulk Schedule Connection size is '+testbulkschconn.size());
                } else{
                    System.debug('Error list is empty.');
                    return null;
                }
        //} catch (ListException e){
       // }
        return null;
    }
    
    // Helper method to create Bulk Addresses    
    @isTest
    public static List<Address__c> createBulkAddress(){
        
        //try{
            // Creates bulk Addresses. Uses Static Resource data file
            List<Address__C> testbulkaddr = Test.loadData(Address__c.sObjectType, 'testAddresses');
            System.assertEquals(testbulkaddr.size(),200);
            
            If (testbulkaddr.isEmpty()== False){
                System.debug('16.Number of Queries used in this apex code so far: ' + Limits.getQueries());
                System.debug('17.Number of rows queried in this apex code so far: ' + Limits.getDmlRows());
                System.debug('18. Number of script statements used so far : ' +  Limits.getDmlStatements());
                System.debug('19.Number of Queries used in this apex code so far: ' + Limits.getQueries());
                System.debug('20.Number of rows queried in this apex code so far: ' + Limits.getDmlRows());
                update testbulkaddr;
                return testbulkaddr;
                System.debug('Bulk address size is '+testbulkaddr.size());
            } else {
                System.debug('Error list is empty. Size of testbulkaddr is '+ testbulkaddr.size());
                return null;
            }
        //} catch (ListException e){
        //}
        return null;
    }
    
    //Creates bulk contacts
    @isTest
    public static List <Contact> createBulkContacts(){
        
        //try{
            // Creates bulk Contacts. Uses Static Resource data file
            List<Contact> testbulkcontact = Test.loadData(Contact.sObjectType, 'testProviders');
            System.assertEquals(testbulkcontact.size(),200);
            
            If (testbulkcontact.isEmpty()== False){
                //update testbulkcontact;
                return testbulkcontact;
                System.debug('Bulk Contact size '+testbulkcontact.size());
                
            } else {
                System.debug('Error list is empty. Size of testbulkcontact is '+ testbulkcontact.size());
                return null;
            }
       // } catch (ListException e){
        //}
        return null;
    }
    
    
    // Helper method to create bulk Address Types. Passes in values from other helper methods    
    @isTest
    public static List <Address_Type__c> createBulkAddressType(){
       // try{
            // Creates bulk Addresses. Uses Static Resource data file
            List<Address__C> testbulkaddr = createBulkAddress();
            System.assertEquals(testbulkaddr.size(),200);
            
            // Create list of bulk Contacts
            List<Contact> testbulkcontacts = createBulkContacts();
            System.assertEquals(testbulkcontacts.size(),200);
            
            If (testbulkaddr.isEmpty()== False &&
                testbulkcontacts.isEmpty()==False){
                    
                    List<Address_Type__c> testbulkaddrtype = new List<Address_Type__c>();
                    For (Integer I = 0 ; I < testbulkcontacts.size(); I++){
                        testbulkaddrtype.add(new Address_Type__c(Provider__c = testbulkcontacts.get(I).id,
                                                                 Address__c = testbulkaddr.get(I).id,
                                                                 Active__c = True));
                    }
                    insert testbulkaddrtype;
                    return testbulkaddrtype;
                    system.debug('address type size ' + testbulkaddrtype.size());
                } else {
                    System.debug('Error list is empty. Size of testbulkaddr is '+ testbulkaddr.size());
                    return null;
                }
       // } catch (ListException e){
       // }
        return null;
    }        
    @isTest
    public static List<Schedule_Development__c> createBulkScheduleDevelopment(){
        
      //  try{
            List<Schedule_Development__c> testbulkschdev = Test.loadData(Schedule_Development__c.sObjectType, 'testScheduleDevelopment');
            System.assertEquals(testbulkschdev.size(),200);
            
            if (testbulkschdev.isEmpty()== False){
                //   update testbulkschdev;
                return testbulkschdev;
            } else {
                System.debug('Error list is empty. Size of Schedule Development file is '+ testbulkschdev.size());
                return null;
            }
       // } catch (ListException e){
       // }
       return null;
    }
    @isTest
    public static List<AuditSetting__c> createBulkAuditSetting(){
        
       // try{
            List<AuditSetting__c> testbulkaudset = Test.loadData(AuditSetting__c.sObjectType, 'testAuditSettings');
            System.assertEquals(testbulkaudset.size(),200);
            
            if (testbulkaudset.isEmpty()== False){
                //   update testbulkaudset;
                return testbulkaudset;
            } else {
                System.debug('Error list is empty. Size of Audit Setting file is '+ testbulkaudset.size());
                return null;
            }
        //} catch (ListException e)
        //{
        return null;
    }
}