
/**
 * Subklassen Bolig som lager en spesifikk type hus som er kjent som bolig
 * Den har en ekstra metode som viser om du har garasje på eiendommen
 * 
 * @author Mathias N Evensen 
 * @version 1.3
 */
public class Bolig extends Hus
{
    private boolean garage;
    /**
     * Constructor for objects of class Bolig
     * @param gateNummer gatenummer
     * @param gateNavn gatenavnet
     * @param pris prisen
     * @param kvadratMeter antall kvadrat
     * @param garage har den garage
     */

    public Bolig(int gateNummer, String gateNavn, int pris, int kvadratMeter, boolean garage)    
    {
        super(gateNummer, gateNavn, pris, kvadratMeter);
        this.garage = garage;
        super.setType("Bolig");
    }
    
    /**
     * Printer samme info som Hus men har lagt til garage som ekstra
     */
    @Override
    public void printInformasjon()
    {
        super.printInformasjon();
        System.out.println("Garageplass: " + garage);
    }
    
    
}
