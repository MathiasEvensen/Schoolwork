
/**
 * Subklassen Leilighet som lager en spesifikk type hus som er kjent som leilighet
 * den har 2 ekstra metoder som sier noe om leilighetsnummer og hvor i blokka man bor
 * 
 * @author Mathias N Evensen 
 * @version 1.3
 */
public class Leilighet extends Hus
{
    
    private int blokkNummer;
    private String hvorIblokka; //sier om du bor oppe nede eller midt i. Opp til fantasien om hvor beskrivende
                                //det skal være.
    
    /**
     * Constructor for objects of class Leilighet
     * @param gateNummer gatenummer
     * @param gateNavn gatenavnet
     * @param pris prisen
     * @param kvadratMeter antall kvadrat
     * @param blokkNummer hva er leilighetsnummeret
     * @param hvorIblokka oppe nede midten
     */
    public Leilighet(int gateNummer, String gateNavn, int pris, int kvadratMeter, int blokkNummer, String hvorIblokka)
    {
        super(gateNummer, gateNavn, pris, kvadratMeter);
        this.blokkNummer = blokkNummer;
        this.hvorIblokka = hvorIblokka;
        super.setType("Leilighet");
    }
    
    /**
     * Printer samme info som Hus men har lagt til leilighetsnummer og
     * hvor man er i blokka som ekstra
     */
    @Override
    public void printInformasjon()
    {
        super.printInformasjon();
        System.out.println("Leilighetsnummer: " + blokkNummer);
        System.out.println("Hvor i blokka er det: " + hvorIblokka);
    }
}
