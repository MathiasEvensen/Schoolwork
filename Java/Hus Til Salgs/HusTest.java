

import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * The test class HusTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class HusTest
{
    private Hus hus1;
    private Hus hus2;

    @Before
    public void setUp()
    {
        hus1 = new Hus();
        hus2 = new Hus(90, "Potetveien", 2400000, "Leilighet", 100, false, "Eie");
    }

    /**
     * Default constructor for test class HusTest
     */
    public HusTest()
    {
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
    public void testSjekkGarasje()
    {
        assertEquals(false, hus2.garage());
        assertEquals(true, hus1.garage());
    }

    @Test
    public void testSjekkKvadratMeter()
    {
        assertEquals(100, hus2.squareMeter());
        assertEquals(240, hus1.squareMeter());
    }

    @Test
    public void testSjekkGate()
    {
        assertEquals("Potetveien", hus2.streetName());
        assertEquals("Greisdalsveien", hus1.streetName());
    }

}









