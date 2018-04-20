import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;
/**
 * Et bolig marked med Hus som superklasse og Bolig og leilighet som subklasser.
 * Dette skal forbedre mitt tidligere boligmarked og forbedre det som var dårlig.
 * Akkurat i denne klassen ligger alle husene tilsalgs sammen.
 * 
 * @author Mathias N Evensen 
 * @version 1.3
 */
public class BoligMarked
{
    private String navn;
    private ArrayList<Hus> husListe;
    
    /**
     * Constructor for objects of class BoligMarked
     * Initsialiserer boligmarkedet
     */
    public BoligMarked()
    {
        navn = "Evensen Boligmarked®";
        husListe = new ArrayList<Hus>();
        meny();
    }
    
    /**
     * Åpningsmeny for main metoden som printer ut en hjelpeliste
     * slikl at man kan få hjelp
     */
    public void meny(){
       System.out.println("Hei og velkommen til " + getNavn());
        System.out.println("Dette er en hjelpemeny for å få deg i gang ");
        System.out.println("Skriv inn mulighetene slik som de står i listen under ");
        System.out.println("Dette er mulighetene dine: ");
        System.out.println("hjelp                 - henter denne menyen");
        System.out.println("legg til bolig        - legger til egendefinert bolig");
        System.out.println("legg til leilighet    - legger til egendefinert leilighet");
        System.out.println("skriv alle            - printer ut en full liste av alle hus ");
        System.out.println("skriv boliger         - printer ut alle boliger");
        System.out.println("skriv leiligheter     - printer ut alle leiligheter ");
        System.out.println("sok paa gatenavn      - søker etter hus på spesifikk gate ");
        System.out.println("sok paa hus           - søker på gatenavn og gatenummer ");
        System.out.println("ovre prisgrense       - søker etter hus som koster mindre enn 'n' kroner ");
        System.out.println("slett hus             - sletter hus som du søker etter ");
        System.out.println("slett gate            - sletter alle hus i gaten du søker på ");
        System.out.println("ovre kvadrat          - søker etter hus som er mindre enn 'n' kvadratmeter ");
        System.out.println("testdata bolig        - legger til 'n' antall testdata for bolig ");
        System.out.println("testdata leilighet    - legger til 'n' antall testdata for leilighet ");
    }
    
    /**
     * Lager en scanner som tar en String som input
     * @return input teksten som skrives inn
     */
    public String getInput(){
        Scanner sr = new Scanner(System.in);
        String input;
        input = sr.nextLine();
        return input;
    }
    
    /**
     * Lager en scanner som tar Integer som input
     * @return input Integer som skrives inn
     */
    public int getInputInteger(){
        Scanner s = new Scanner(System.in);
        int input;
        input = s.nextInt();
        return input;
    }
    
    /**
     * @return navn på Boligmarkedet
     */
    public String getNavn()
    {
        return navn;
    }
    
    /**
     * Legger til husobjektene inn i boligmarkedet
     * @param nyttHus som legges til i lista
     */
    public void addHus(Hus nyttHus)
    {
        husListe.add(nyttHus);
    }
    
    /**
     * Legger til en ny ikkeeksisterende Bolig til lista
     * @param gateNummer gatenummeret
     * @param gateNavn gatenavnet
     * @param pris prisen på bolig
     * @param kvadratMeter kvadraten på boligen
     * @param garage har du garageplass eller ikke
     */
    public void leggTilBolig(int gateNummer, String gateNavn, int pris, int kvadratMeter, boolean garage)
    {
        Bolig nyBolig;
        nyBolig = new Bolig(gateNummer, gateNavn, pris, kvadratMeter, garage);
        addHus(nyBolig);
    }
    
    /**
     * Legger til en ny ikkeeksisterende Leilighet til lista
     * @param gateNummer gatenummeret
     * @param gateNavn gatenavnet
     * @param pris prisen på leiligheten
     * @param kvadratMeter kvadraten på leiligheten
     * @param blokkNummer leilighetsnummeret
     * @param hvorIblokka sier oppe nede midten osv
     */
    public void leggTilLeilighet(int gateNummer, String gateNavn, int pris, int kvadratMeter, int blokkNummer, String hvorIblokka)
    {
        Leilighet nyLeilighet;
        nyLeilighet = new Leilighet(gateNummer, gateNavn, pris, kvadratMeter, blokkNummer, hvorIblokka);
        addHus(nyLeilighet);
    }
    
    /**
     * Printer ut kun boliger ved hjelp
     * av en instanse som leter etter boligobjekter.
     */
    public void printKunBoliger()
    {
        System.out.println("Alle boliger: \n");
        for (Hus etHus : husListe) {
            if (etHus instanceof Bolig) {
                etHus.printInformasjon();
            }
            else if(husListe.isEmpty()){
                System.out.println("Ingen til salgs akkurat nå");
            }
        }
    }
    
    /**
     * Printer ut kun leiligheter ved hjelp
     * av en instanse som leter etter leilighetsobjekter.
     */
    public void printKunLeiligheter()
    {
        System.out.println("Alle leiligheter: \n");
        for (Hus etHus : husListe) {
            if (etHus instanceof Leilighet) {
                etHus.printInformasjon();
            }
            else if(husListe.isEmpty()){
                System.out.println("Ingen til salgs akkurat nå");
            }
        }
    }
    
    /**
     * Skriver ut all informasjonenen om hvert enkelt hus
     */
    public void skrivHus()//////////////////////////////////////////////////////
    {
        System.out.println("Boligene og leilighetene til salgs hos " + navn);
        System.out.println("_______________________________");
        
        if (husListe.isEmpty()) {
            System.out.println("Ingen til salgs akkurat nå");
        }
        
        int looper;
        Hus etHus;
        int printet = 0;
        int antall = husListe.size();
        
        for (looper = 0; looper < antall; looper++) {
            etHus = husListe.get(printet);
            etHus.printInformasjon();
            printet++;
        }
        System.out.println("-----------------------------");
        System.out.println("Antall på markedet er: " + husListe.size());
        System.out.println();
    }
    
    /**
     * Gjør at du kan søke på et hus i et gatenavn og printer ut alle
     * husene i den gata
     * @param sokString Gatenavnet det skal søkes etter
     */
    public void finnHusPaaGatenavn(String sokString)
    {
        int looper = 0;
        
        
        if(husListe.isEmpty()){
                    System.out.println("Det er ingen hus i listen");
        }
        for (Hus etHus : husListe) { //////////////////////////
            etHus = husListe.get(looper);
            if (etHus.getGateNavn().equalsIgnoreCase(sokString)) {
                etHus.printInformasjon();
            }
            looper++;
        }
    }
    
    /**
     * Gjør at du kan søke på en nedre prisgrense slik at alle
     * hus billigere en grensen printes ut
     * @param prisGrense pris grensen
     */
    public void finnHusBilligereEnn(int prisGrense)
    {
        int teller;
        int antall = husListe.size();
        Hus etHus;
        int printet = 0;
        
        for (teller = 0; teller < antall; teller++) {
            etHus = husListe.get(teller);
            if (etHus.getPris() <= prisGrense) {
                etHus.printInformasjon();
                printet++;
            }
        }
        System.out.println("Det er " + printet + " hus billigere enn " + prisGrense + " Kroner");
    }
    
    /**
     * Denne funksjonen søker etter ett spesifikt hus.
     * Det gjør den ved å ta i bruk en for each loop.
     * @param gate
     * @param nummer
     */
    public void finnHusPaaGateOgNummer(String gate, int nummer)
    {
        if(husListe.isEmpty()){
                    System.out.println("Det er ingen hus i listen");
        }
        int looper = 0;
        
        
        for (Hus etHus : husListe){////////////////////////
            etHus = husListe.get(looper);
            if (etHus.getGateNavn().equalsIgnoreCase(gate) && 
                    etHus.getGateNummer() == nummer) {
                etHus.printInformasjon();
            }
            looper++;
        }
    }
    
    /**
     * for (Iterator<Hus> it = husListe.iterator(); it.hasNext();){
            Hus etHus = it.next();
            if (etHus.getGateNavn().equalsIgnoreCase(gate) && 
                    etHus.getGateNummer() == nummer) {
                etHus.printInformasjon();
            }
        }
    }
     */
    
    /**
     * Sletter det huset du søker på
     * @param sokString gatenavnet
     * @param nummer nummeret på huset
     */
    public void slettEttHus(String sokString, int nummer)
    {
        if(husListe.isEmpty()){
                    System.out.println("Det er ingen hus i listen");
        }
        
        for (Iterator<Hus> it = husListe.iterator(); it.hasNext();) {
            Hus etHus = it.next();
            if (etHus.getGateNavn().equalsIgnoreCase(sokString) &&
            etHus.getGateNummer() == nummer) {
                it.remove();
            }
            
        }
    }//TODO legg til error hvis gate ikke finnes/ antall slettet = 0
    
    /**
     * Sletter alle husene på et gatenavn som du søker etter
     * @param sokString navnet på gaten
     */
    public void slettAlleHusPaaGatenavn(String sokString)
    {
        if(husListe.isEmpty()){
                    System.out.println("Det er ingen hus i listen");
        }
        
        Iterator<Hus> it;
        it = husListe.iterator();
        int antallSlettet = 0;
        
        while (it.hasNext()) {
            Hus etHus = it.next();
            if (etHus.getGateNavn().equalsIgnoreCase(sokString)) {
                it.remove();
                antallSlettet++;
            }
            
        }
        
        System.out.println("Du har slettet: " + antallSlettet + " hus");
    }
    
    /**
     * Finner alle hus mindre enn den kvadratmeteren du søker etter
     * @param kvadrat grensen på kvadratmeter
     */
    public void HusMindreEnnKvadrat(int kvadrat)
    {
        if(husListe.isEmpty()){
                    System.out.println("Det er ingen hus i listen");
        }
        Iterator<Hus> it = husListe.iterator();
        
        
        for (; it.hasNext();) {
            Hus etHus = it.next();
            if (etHus.getKvadratMeter() <= kvadrat) {
                etHus.printInformasjon();
            }
        }
    }
    
    /**
     * Legger til ferdigbygde boliger inn i Arraylisten
     * @param antall hvor mange
     */
    public void leggTilTestDataBolig(int antall)
    {
        int putInn = 0;
        int random2 = 0;
        int random = 1;
        int pris;
        int gateNummer;
        String gateNavn = "Boligveien";
        int kvadratMeter;
        boolean garage = true;
        
        while (putInn < antall) {
            gateNummer = random;
            pris = 30000000/100 + 2500*random++;
            kvadratMeter = 100 + 5*random2++;
            
            Bolig nyBolig;
            nyBolig = new Bolig(gateNummer, gateNavn, pris, kvadratMeter, garage);
            addHus(nyBolig);
            putInn++;
        }
    }
    
    /**
     * Legger til ferdigbygde leiligheter inn i Arraylisten
     * @param antall hvor mange
     */
    public void leggTilTestDataLeilighet(int antall)
    {
        int putInn = 0;
        int random2 = 0;
        int random = 1;
        int pris;
        int gateNummer;
        String gateNavn = "Leilighetsgata";
        int kvadratMeter;
        int blokkNummer;
        String hvorIblokka = " ";
        
        while (putInn < antall) {
            gateNummer = random;
            pris = 30000000/100 + 2500*random++;
            kvadratMeter = 50 + 2*random2++;
            blokkNummer = random;
            
            Leilighet nyLeilighet;
            nyLeilighet = new Leilighet(gateNummer, gateNavn, pris, kvadratMeter, blokkNummer, hvorIblokka);
            addHus(nyLeilighet);
            putInn++;
        }
    }
}
