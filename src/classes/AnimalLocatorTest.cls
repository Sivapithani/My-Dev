@istest
public class AnimalLocatorTest {
    @istest static void getanimalbyid(){
   Test.Setmock(Httpcalloutmock.class, new AnimalLocatorMock());
        string result =AnimalLocator.getAnimalNameById(1);
        system.debug('result'+result);
        String expectedResult = 'chicken';
        System.assertEquals(result,expectedResult );
    }
}