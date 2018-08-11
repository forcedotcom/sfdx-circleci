global without sharing class CalcDate{
    /* Map used to assign Integer values to days of week from system. Could have also used a native formula field (waste)
     */
    public static final String namespacedScheduleObject = NameSpaceUtils.getNamespaceWithPrefix() + 'Schedule_Connection__c';
    static map<string,integer> dowMap = new map<string,integer>{'Monday'=>0,
                                                                'Tuesday'=>1,
                                                                'Wednesday'=>2,
                                                                'Thursday'=>3,
                                                                'Friday'=>4,
                                                                'Saturday'=>5,
                                                                'Sunday'=>6};

     /*Map used to assign Integer values to selected times from system. Times in system are picklist which are Strings
     */
                                                                    
     static map<string,PairNumber> timeMap = new map<string,PairNumber>();
    static{                                                               
        timeMap.put('0:00:00', new PairNumber(0, 0));
        timeMap.put('0:15:00', new PairNumber(0, 15));
        timeMap.put('0:30:00', new PairNumber(0, 30));
        timeMap.put('0:45:00', new PairNumber(0, 45));
        timeMap.put('1:00:00', new PairNumber(1, 0));
        timeMap.put('1:15:00', new PairNumber(1, 15));
        timeMap.put('1:30:00', new PairNumber(1, 30));
        timeMap.put('1:45:00', new PairNumber(1, 45));
        timeMap.put('2:00:00', new PairNumber(2, 0));
        timeMap.put('2:15:00', new PairNumber(2, 15));
        timeMap.put('2:30:00', new PairNumber(2, 30));
        timeMap.put('2:45:00', new PairNumber(2, 45));
        timeMap.put('3:00:00', new PairNumber(3, 0));
        timeMap.put('3:15:00', new PairNumber(3, 15));
        timeMap.put('3:30:00', new PairNumber(3, 30));
        timeMap.put('3:45:00', new PairNumber(3, 45));
        timeMap.put('4:00:00', new PairNumber(4, 0));
        timeMap.put('4:15:00', new PairNumber(4, 15));
        timeMap.put('4:30:00', new PairNumber(4, 30));
        timeMap.put('4:45:00', new PairNumber(4, 45));
        timeMap.put('5:00:00', new PairNumber(5, 0));
        timeMap.put('5:15:00 ', new PairNumber(5, 15));
        timeMap.put('5:30:00', new PairNumber(5, 30));
        timeMap.put('5:45:00', new PairNumber(5, 45));
        timeMap.put('6:00:00', new PairNumber(6, 0));
        timeMap.put('6:15:00', new PairNumber(6, 15));
        timeMap.put('6:30:00', new PairNumber(6, 30));
        timeMap.put('6:45:00', new PairNumber(6, 45));
        timeMap.put('7:00:00', new PairNumber(7, 0));
        timeMap.put('7:15:00', new PairNumber(7, 15));
        timeMap.put('7:30:00', new PairNumber(7, 30));
        timeMap.put('7:45:00', new PairNumber(7, 45));
        timeMap.put('8:00:00', new PairNumber(8, 0));
        timeMap.put('8:15:00', new PairNumber(8, 15));
        timeMap.put('8:30:00', new PairNumber(8, 30));
        timeMap.put('8:45:00', new PairNumber(8, 45));
        timeMap.put('9:00:00', new PairNumber(9, 0));
        timeMap.put('9:15:00', new PairNumber(9, 15));
        timeMap.put('9:30:00', new PairNumber(9, 30));
        timeMap.put('9:45:00 ', new PairNumber(9, 45));
        timeMap.put('00:00:00', new PairNumber(0, 0));
        timeMap.put('00:15:00', new PairNumber(0, 15));
        timeMap.put('00:30:00', new PairNumber(0, 30));
        timeMap.put('00:45:00', new PairNumber(0, 45));
        timeMap.put('01:00:00', new PairNumber(1, 0));
        timeMap.put('01:15:00', new PairNumber(1, 15));
        timeMap.put('01:30:00', new PairNumber(1, 30));
        timeMap.put('01:45:00', new PairNumber(1, 45));
        timeMap.put('02:00:00', new PairNumber(2, 0));
        timeMap.put('02:15:00', new PairNumber(2, 15));
        timeMap.put('02:30:00', new PairNumber(2, 30));
        timeMap.put('02:45:00', new PairNumber(2, 45));
        timeMap.put('03:00:00', new PairNumber(3, 0));
        timeMap.put('03:15:00', new PairNumber(3, 15));
        timeMap.put('03:30:00', new PairNumber(3, 30));
        timeMap.put('03:45:00', new PairNumber(3, 45));
        timeMap.put('04:00:00', new PairNumber(4, 0));
        timeMap.put('04:15:00', new PairNumber(4, 15));
        timeMap.put('04:30:00', new PairNumber(4, 30));
        timeMap.put('04:45:00', new PairNumber(4, 45));
        timeMap.put('05:00:00', new PairNumber(5, 0));
        timeMap.put('05:15:00 ', new PairNumber(5, 15));
        timeMap.put('05:30:00', new PairNumber(5, 30));
        timeMap.put('05:45:00', new PairNumber(5, 45));
        timeMap.put('06:00:00', new PairNumber(6, 0));
        timeMap.put('06:15:00', new PairNumber(6, 15));
        timeMap.put('06:30:00', new PairNumber(6, 30));
        timeMap.put('06:45:00', new PairNumber(6, 45));
        timeMap.put('07:00:00', new PairNumber(7, 0));
        timeMap.put('07:15:00', new PairNumber(7, 15));
        timeMap.put('07:30:00', new PairNumber(7, 30));
        timeMap.put('07:45:00', new PairNumber(7, 45));
        timeMap.put('08:00:00', new PairNumber(8, 0));
        timeMap.put('08:15:00', new PairNumber(8, 15));
        timeMap.put('08:30:00', new PairNumber(8, 30));
        timeMap.put('08:45:00', new PairNumber(8, 45));
        timeMap.put('09:00:00', new PairNumber(9, 0));
        timeMap.put('09:15:00', new PairNumber(9, 15));
        timeMap.put('09:30:00', new PairNumber(9, 30));
        timeMap.put('09:45:00 ', new PairNumber(9, 45));        
        timeMap.put('10:00:00', new PairNumber(10, 0));
        timeMap.put('10:15:00', new PairNumber(10, 15));
        timeMap.put('10:30:00', new PairNumber(10, 30));
        timeMap.put('10:45:00', new PairNumber(10, 45));
        timeMap.put('11:00:00', new PairNumber(11, 0));
        timeMap.put('11:15:00', new PairNumber(11, 15));
        timeMap.put('11:30:00', new PairNumber(11, 30));
        timeMap.put('11:45:00', new PairNumber(11, 45));
        timeMap.put('12:00:00', new PairNumber(12, 0));
        timeMap.put('12:15:00', new PairNumber(12, 15));
        timeMap.put('12:30:00', new PairNumber(12, 30));
        timeMap.put('12:45:00', new PairNumber(12, 45));
        timeMap.put('13:00:00', new PairNumber(13, 0));
        timeMap.put('13:15:00', new PairNumber(13, 15));
        timeMap.put('13:30:00', new PairNumber(13, 30));
        timeMap.put('13:45:00', new PairNumber(13, 45));
        timeMap.put('14:00:00', new PairNumber(14, 0));
        timeMap.put('14:15:00', new PairNumber(14, 15));
        timeMap.put('14:30:00', new PairNumber(14, 30));
        timeMap.put('14:45:00', new PairNumber(14, 45));
        timeMap.put('15:00:00', new PairNumber(15, 0));
        timeMap.put('15:15:00', new PairNumber(15, 15));
        timeMap.put('15:30:00', new PairNumber(15, 30));
        timeMap.put('15:45:00', new PairNumber(15, 45));
        timeMap.put('16:00:00', new PairNumber(16, 0));
        timeMap.put('16:15:00', new PairNumber(16, 15));
        timeMap.put('16:30:00', new PairNumber(16, 30));
        timeMap.put('16:45:00', new PairNumber(16, 45));
        timeMap.put('17:00:00', new PairNumber(17, 0));
        timeMap.put('17:15:00', new PairNumber(17, 15));
        timeMap.put('17:30:00', new PairNumber(17, 30));
        timeMap.put('17:45:00', new PairNumber(17, 45));
        timeMap.put('18:00:00', new PairNumber(18, 0));
        timeMap.put('18:15:00', new PairNumber(18, 15));
        timeMap.put('18:30:00', new PairNumber(18, 30));
        timeMap.put('18:45:00', new PairNumber(18, 45));
        timeMap.put('19:00:00', new PairNumber(19, 0));
        timeMap.put('19:15:00', new PairNumber(19, 15));
        timeMap.put('19:30:00', new PairNumber(19, 30));
        timeMap.put('19:45:00', new PairNumber(19, 45));
        timeMap.put('20:00:00', new PairNumber(20, 0));
        timeMap.put('20:15:00', new PairNumber(20, 15));
        timeMap.put('20:30:00', new PairNumber(20, 30));
        timeMap.put('20:45:00', new PairNumber(20, 45));
        timeMap.put('21:00:00', new PairNumber(21, 0));
        timeMap.put('21:15:00', new PairNumber(21, 15));
        timeMap.put('21:30:00', new PairNumber(21, 30));
        timeMap.put('21:45:00', new PairNumber(21, 45));
        timeMap.put('22:00:00', new PairNumber(22, 0));
        timeMap.put('22:15:00', new PairNumber(22, 15));
        timeMap.put('22:30:00', new PairNumber(22, 30));
        timeMap.put('22:45:00', new PairNumber(22, 45));
        timeMap.put('23:00:00', new PairNumber(23, 0));
        timeMap.put('23:15:00', new PairNumber(23, 15));
        timeMap.put('23:30:00', new PairNumber(23, 30));
        timeMap.put('23:45:00', new PairNumber(23, 45));  
    }

     /* End of Static variable */
                                                                    
    @InvocableMethod(label='Compute datetime' description='Computes dates from text input')
                               
    global static list<String> getMyDates(list<Id> sobjschdev){
        /* List to create new Schedule records
         * Had trouble passing in full Sobject from Flow so doing query here */
        
        list<Schedule__c> newschedule = new list<Schedule__c>();
        
        /* Class must return no more than 1 item. String used as return value to Flow until Collections can be returned.
         * Essentially a dummy item */
        
        /* List to compute dates from text and Integer input
         * List to split days from multiselect picklist */

        list<String> dummystring = new list<String>();
        dummystring.add('getMyDates Ran Successfully');           
        list<String> dayslist = new List<String>();        
        set<Integer> daysadd = new set<Integer>{7,14,21,28};
        
        /* Query to pull all Schedule Connections passed to class.
        *  Can likely remove when can pass in full Sobject from Flow */
        
        List<Schedule_Connection__c> schconnList = [Select Schedule_Development__c, Schedule_Development__r.YearNumber__c,
                                                   Schedule_Development__r.MonthNumber__c, Schedule_Development__r.Scheduled_Days__c,
                                                   Schedule_Development__r.Start_Time__c,Schedule_Development__r.End_Time__c,
                                                   AuditSetting__c, Address_Type__c, Address_Type__r.Provider__c,
                                                   Address_Type__r.Address__c, Schedule_Count__c, Product_Name__c, Scenario__c,
                                                         StartDate__c, EndDate__c from Schedule_Connection__c
                                                   WHERE Id in :sobjschdev];
        Integer size = schconnList.size();
        System.assert(size > 0, 'Schedule Connection List is empty');
        
        System.debug('Size of Schedule Connection List is ' + schconnList.size());
        
        /* Lists to hold different product names. Enables class to be used in both situations */
        List <Schedule_Connection__c> schconnmembonecustserv = new List<Schedule_Connection__c >();
        List <Schedule_Connection__c> schconnmembaddr = new List<Schedule_Connection__c >();
        
        If(schconnList.isEmpty() == False){
            For (Schedule_Connection__c sclist : schconnList){ //Loop through all Schedule Connections passed in
                    if (sclist.Product_Name__c == 'MemberOne'){ //Checks product name of Schedule Connection and assigns to Address list
                        schconnmembaddr.add(sclist);
                    }

                    if (sclist.Product_Name__c  == 'MemberOneCustomerService'){ //Checks product name of Schedule Connection and assigns to MemberOne_CustomerService list
                        schconnmembonecustserv.add(sclist);
                    }
            }
            System.Debug('Size of MemberOne Address Schedule Connection List is ' + schconnmembaddr.size());
            System.Debug('Size of MemberOne MemberOne_CustomerService Schedule Connection List is ' + schconnmembonecustserv.size());
            
/* Begin Loop through Schedules to be created for MemberOne Address */            
            
            For (Schedule_Connection__c scmemaddr : schconnmembaddr ){
                integer year = scmemaddr.Schedule_Development__r.YearNumber__c.intvalue(); //Probably not supposed to assign in here?
                integer month = scmemaddr.Schedule_Development__r.MonthNumber__c.intvalue();
                string starttime = scmemaddr.Schedule_Development__r.Start_Time__c;
                string endtime = scmemaddr.Schedule_Development__r.End_Time__c;
                PairNumber pairstart = timeMap.get(starttime);
                PairNumber pairend = timeMap.get(endtime);
                Integer starthr = pairstart.x;
                Integer endhr = pairend.x;
                Integer startmin = pairstart.y;
                Integer endmin = pairend.y;
                integer count = 0;
                daysList.clear();     //Start new list of days
                daysList.addall(scmemaddr.Schedule_Development__r.Scheduled_Days__c.split(';'));     //Splits multiselect picklist for days
                Date startdate = Date.today();
                Date enddate = Date.today();

                If (scmemaddr.StartDate__c == null){
                    startdate = date.newInstance(year, month, 1);
                } else {
                    startdate = scmemaddr.StartDate__c;
                }
                
                If (scmemaddr.EndDate__c == null){
                    enddate = Date.newInstance(year,month,date.daysInMonth(year, month));
                } else {
                    enddate = scmemaddr.EndDate__c;
                }
                
                For (String day:daysList){
                    date d = date.newInstance(year,month,1);
                    d=d.addDays(math.mod(7-dayOfWeek(d)+dowMap.get(day),7));//brings you to the first instance of the specified dayOfWeekName of the month
                    
                    while (d.month()==month) {
                        If (d >= startdate && d <= enddate) {
                            System.debug('Date is ' + d);
                            newschedule.add(new Schedule__c(Start_Date__c = d,
                                                     StartDateTime__c = Datetime.valueOf(d.year()+'-'+d.month()+'-'+d.day()+' '+starthr +':'+startmin +':'+'0'),
                                                     EndDateTime__c = Datetime.valueOf(d.year()+'-'+d.month()+'-'+d.day()+' '+endhr+':'+endmin +':'+'0'),
                                                     Start_Time__c = starttime,
                                                     End_Time__c = endtime,
                                                     Address_Type__c = scmemaddr.Address_Type__c,
                                                     Provider__c = scmemaddr.Address_Type__r.Provider__c,
                                                     Address__c = scmemaddr.Address_Type__r.Address__c ));
                            count++;
                            d=d.addDays(7);
                        } else {
                            d=d.addDays(7);
                        }
                    }
                }System.debug('Total Address Schedules to add is ' + count);
            }
            
/* Begin loop for Schedules to be created for MemberOne_CustomerService */
            
            For (Schedule_Connection__c scmocustserv : schconnmembonecustserv ){
                integer year = scmocustserv.Schedule_Development__r.YearNumber__c.intvalue();
                integer month = scmocustserv.Schedule_Development__r.MonthNumber__c.intvalue();
                integer totalschedules = scmocustserv.Schedule_Count__c.intvalue();
                string starttime = scmocustserv.Schedule_Development__r.Start_Time__c;
                string endtime = scmocustserv.Schedule_Development__r.End_Time__c;
                integer count = 0;
                daysList.clear();     //Start new list of days
                daysList.addall(scmocustserv.Schedule_Development__r.Scheduled_Days__c.split(';'));     //Splits multiselect picklist for days
                PairNumber pairstart = timeMap.get(starttime);
                PairNumber pairend = timeMap.get(endtime);
                Integer starthr = pairstart.x;
                Integer endhr = pairend.x;
                
                Date startdate = Date.today();
                Date enddate = Date.today();

                If (scmocustserv.StartDate__c == null){
                    startdate = date.newInstance(year, month, 1);
                } else {
                    startdate = scmocustserv.StartDate__c;
                }
                
                If (scmocustserv.EndDate__c == null){
                    enddate = Date.newInstance(year,month,date.daysInMonth(year, month));
                } else {
                    enddate = scmocustserv.EndDate__c;
                }
                
                While(count < totalschedules){
                For (String day:daysList){
                    date d = date.newInstance(year,month,1);
                    d=d.addDays(math.mod(7-dayOfWeek(d)+dowMap.get(day),7));//brings you to the first instance of the specified dayOfWeekName of the month
                    
                    while (d.month()==month && count < totalschedules) {
                        System.debug('Value of d for date is' + d);
                        If (d >= startdate && d <= enddate) {
                            System.debug('Date is ' + d);
                            Decimal schtime = ((Math.random()*(endhr - starthr)) + starthr); // Assigns random start hours
                            Decimal minutes = (Math.floor(Math.random()*(60-0)+0)); // Assigns random minutes
                            newschedule.add(new Schedule__c(Start_Date__c = d,
                                                     StartDateTime__c = Datetime.valueOf(d.year()+'-'+d.month()+'-'+d.day()+' '+schtime.intValue()+':'+minutes.intvalue() +':'+'0'),
                                                     HitSettingType__c = scmocustserv.Scenario__c));
                            count++;
                            d=d.addDays(7);                           
                } else {
                    d=d.addDays(7);
                }
                    }
                }}System.debug('Total MemberOne_CustomerService Schedules to add is ' + count);
            }
        } insert newschedule; // Working up to here
        return null;
    }
    
    public static integer dayOfWeek(date d){
        return math.mod(date.newInstance(1900,1,8).daysBetween(d),7); 
    }

}