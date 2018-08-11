global without sharing class CalcSchDate{
    /* List to get DateTime from Date and picklist time inputs
     * Takes collection variable from Flow for processing
     */
    @InvocableMethod(label='Compute datetime' description='Computes date time from text values')
    
    global static list<String> getMyDates(List<List<Schedule__c>> sobjsch){
         
        Integer size = sobjsch.size();
        System.assert(size > 0, 'Schedule List is empty');
        System.debug('Size of Schedule List should be 1 because List of Lists. Value is ' + sobjsch.size());
        
        List<Schedule__c> schUpdate = new List<Schedule__c>{};
            For (List<Schedule__c> innerloop : sobjsch){
                for(Schedule__c schedule : innerloop){
                    schedule.StartDateTime__c = getDateTime(schedule.Start_Date__c,schedule.Start_Time__c);
                    schedule.EndDateTime__c = getDateTime(schedule.End_Date__c,schedule.End_Time__c);
                    schUpdate.add(schedule);
                }
            }
        
        update schUpdate;
        return null;
    }
    
    //======================================================//
    //Compute and Populate Date Time in Start and End Time field values
    //======================================================//
    public static DateTime getDateTime(Date s,String dtTime) {
      if(s != null && dtTime != null){
        return Datetime.valueOf(s.year()+ '-' + s.month() 
                               + '-' + s.day() + ' ' + dtTime);
      }
      return DateTime.newInstance(1900,1,1);
    }   
}