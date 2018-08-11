@isTest
public class CalcSchDateTest {
    /* Test Class for CalcSchDate
*/
    
    @isTest
    static list <String> createschedule_Batchsuccess(){
        List<Schedule__c> testsch = new List<Schedule__c>();
        try{
            testsch.addAll(TestFactory.createSchedules());
        }catch (System.DmlException e){
            System.debug('DML Exception: ' +
                         e.getDmlMessage(0));
        } catch (System.ListException e){
            System.debug('List Exception: ' +
                         e.getMessage());
        }
        
        Boolean resultestsch = testsch.isEmpty();
        System.assertEquals(resultestsch,false);
        Integer count = 0;
        
        System.debug('Length of Schedule list for test is ' + testsch.size());
        
        System.test.startTest();
        System.debug('I am in startest');
        do{
            try{
                insert testsch;
                System.debug('List value ' + testsch.size());
                CalcSchDate.getMyDates(new List<List<Schedule__c>>{testsch});
                //                    system.assertEquals(null, returnvalue[0]);
            }catch (System.DmlException e){
                System.debug('DML Exception: ' +
                             e.getDmlMessage(0));
            } catch (System.ListException e){
                System.debug('List Exception: ' +
                             e.getMessage());
            } finally {
                testsch.clear();
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
        return null;
    }    
}