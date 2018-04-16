

import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * The test class HusMarkedTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class HusMarkedTest
{
    private HusMarked husMarke1;

    /**
     * Default constructor for test class HusMarkedTest
     */
    public HusMarkedTest()
    {
    }

    /**
     * Sets up the test fixture.
     *
     * Called before every test case method.
     */
    @Before
    public void setUp()
    {
        husMarke1 = new HusMarked();
        husMarke1.addTestData(5);
        husMarke1.addTestData2(5);
    }

    /**
     * Tears down the test fixture.
     *
     * Called after every test case method.
     */
    @After
    public void tearDown()
    {
    }

    @Test
    public void testDeleteAllHousesOnStreetName()
    {
        husMarke1.deletAlleHousesOnStreetname("A");
        husMarke1.printAllHouses();
    }
    
    /**
     * Her ser jeg at jeg ikke får opp noe konfirmasjon
     * på at jeg slettet huset, slik jeg fikk i testDeleteAllHousesOnStreetName burde fikses.
     */
    @Test
    public void testRemoveOneHouse()
    {
        husMarke1.removeOneHouse("B", 1);
    }
    
    /**
     * Unaturlige tall gikk fint. Et vanlig hus ville ikke ha hatt en slik pris eller gatnummer.
     * Burde ha satt en begrensing!
     */
    @Test
    public void testAddOwnHouseLessInfoUnaturligeTall()
    {
        husMarke1.addOwnHouseLessInfo(100003464, "Poopveien", 23, 3444);
        husMarke1.printAllHouses();
    }

    @Test
    public void TestAddHouseVoid()
    {
        Hus hus1 = new Hus();
        husMarke1.addHouse(hus1);
        husMarke1.printAllHouses();
    }

    @Test
    public void testAddTestDataWorks()
    {
        assertEquals(true, husMarke1.addTestData(5));
        husMarke1.printAllHouses();
    }

    @Test
    public void testAddTestDataFalse()
    {
        assertEquals(false, husMarke1.addTestData(55));
    }


    @Test
    public void testAddTestDataFAIL()
    {
        assertEquals(false, husMarke1.addTestData2(55));
    }


    @Test
    public void testSjekkAntall()
    {
        assertEquals(10, husMarke1.getAntallHus());
    }
}










