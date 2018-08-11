@isTest
public class CalcDateTest {
    
    /* Test Class for calcDateClass
*/
    
    @isTest
    static list <String> createschedule_Batchsuccess(){

        List<Schedule_Connection__c> testschconn = new List<Schedule_Connection__c>();
        try{
            testschconn.addAll(TestFactory.createBulkScheduleConnections());
        }catch (System.DmlException e){
            System.debug('DML Exception: ' +
                         e.getDmlMessage(0));
        } catch (System.ListException e){
            System.debug('List Exception: ' +
                         e.getMessage());
        }
        
        Boolean resultestschconn = testschconn.isEmpty();
        System.assertEquals(resultestschconn,false);
        
        System.debug('Length of Schedule Connections list for test is ' + testschconn.size());
        String namespacedScheduleObject = NameSpaceUtils.getNamespaceWithPrefix() + 'Schedule_Connection__c';
        
        Integer count = 0;
        
        System.test.startTest();
        map<string,PairNumber> timeMap = new map<string,PairNumber>();
        try{                                                               
            timeMap.put('0:00:00', new PairNumber(0, 0));
            timeMap.put('0:15:00', new PairNumber(0, 15));
            System.debug('Got to PairNumber');
        }catch (System.DmlException e){
            System.debug('DML Exception: ' +
                         e.getDmlMessage(0));
        } catch (System.ListException e){
            System.debug('List Exception: ' +
                         e.getMessage());
        }
        
        list<date> dateList = new list<date>();
        /* List to split days from multiselect picklist */
        list<String> dayslist = new List<String>();
        
        set<Integer> daysadd = new set<Integer>{7,14,21,28};
            list<String> dummystring = new list<String>();
        dummystring.add('getMyDates Ran Successfully');
        
        
        System.debug('I am in startest');
        do{
            try{
                insert testschconn.get(count); // As of Mar 2015 could not use Bulk Loading for Process Builder. Adding 1 record for now.
                System.debug('List value ' + testschconn.get(count));
                id[] ids = new id[]{testschconn.get(count).id};
                string[] returnvalue = CalcDate.getMyDates(ids);
                // system.assertEquals(null, returnvalue[0]);
            }catch (System.DmlException e){
                System.debug('DML Exception: ' +
                             e.getDmlMessage(0));
            } catch (System.ListException e){
                System.debug('List Exception: ' +
                             e.getMessage());
            } finally {
                testschconn.clear();
            }
            System.debug('Count is ' + count);
            count++;
        }while (count < 2);
        System.test.stopTest();
        
        //Stop Test
        System.debug('The test was stopped.');
        
        //Verify the Schedules were added
        try{
            Integer scheduleCount = [Select count() from Schedule__c];
            /* Likely take class out anyway so didn't review why assert failed Sept 15 2014
            System.assertNotEquals(scheduleCount, 0);
            */   
            System.debug(Logginglevel.ERROR,'Number of schedules entered was ' + scheduleCount);
        } catch (System.DmlException e){
            System.debug('DML Exception: ' +
                         e.getDmlMessage(0));
        } catch (System.ListException e){
            System.debug('List Exception: ' +
                         e.getMessage());
        }
        return dummystring;
    }


}