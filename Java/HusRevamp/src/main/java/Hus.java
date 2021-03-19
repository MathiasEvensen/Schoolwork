/**
 * Superklassen Hus som er byggesteinen til subklassene Bolig og Leilighet.
 * 
 * @author Mathias N Evensen 
 * @version 1.3
 */
public class Hus
{
    private int gateNummer;
    private String gateNavn;
    private int pris;
    private String type;   //what type of house it is ex. Condo, Apartment, House etc
    private int kvadratMeter;
    
    /**
     * Constructor for objects of class Hus
     * @param gateNummer gatenummer
     * @param gateNavn gatenavnet
     * @param pris prisen
     * @param kvadratMeter antall kvadrat
     */
    public Hus(int gateNummer, String gateNavn, int pris, int kvadratMeter)
    {
        this.gateNummer = gateNummer;
        this.gateNavn = gateNavn;
        this.pris = pris;
        this.kvadratMeter = kvadratMeter;
    }
    
    /**
     * Constructor for objects of class Hus
     * @param gateNummer gatenummer
     * @param gateNavn gatenavnet
     * @param pris prisen
     * @param type hvilket type hus
     * @param kvadratMeter antall kvadrat
     */
    public Hus(int gateNummer, String gateNavn, int pris, String type, int kvadratMeter)
    {
        this.gateNummer = gateNummer;
        this.gateNavn = gateNavn;
        this.pris = pris;
        this.type = type;
        this.kvadratMeter = kvadratMeter;
    }

    
    /**
     * @return gateNummer
     */
    public int getGateNummer()
    {
        return gateNummer;
    }
    
    /**
     * @return gateNavn
     */
    public String getGateNavn()
    {
        return gateNavn;
    }
    
    /**
     * @return pris
     */
    public int getPris()
    {
        return pris;
    }
    
    /**
     * @return type
     */
    public String getType()
    {
        return type;
    }
    
    /**
     * @param type hus
     */
    public void setType(String type)
    {
        this.type = type;
    }

    /**
     * @return kvadratMeter
     */
    public int getKvadratMeter()
    {
        return kvadratMeter;
    }
    
    /**
     * Printer ut all informasjonen om et hus
     */
    public void printInformasjon()
    {
        System.out.println("____________________________");
        System.out.println("Adressen er:  " + gateNavn + " " + gateNummer);
        System.out.println("Pris:         " + pris + " Kroner");
        System.out.println("Type hus:     " + type);
        System.out.println("Kvadratmeter: " + kvadratMeter + "m" + "\u00B2");
        System.out.println();
    }
}
