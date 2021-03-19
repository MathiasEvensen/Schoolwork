/**
 * Dette er main metoden som kjører programmet i en kommandolinje.
 * Her kan man skrive inn kommandoer for å simulere et boligmarked.
 * @author Mathias N Evensen
 * @version 1.3
 */

public class Main {

    /**
     * Main metoden starter programmet.
     * Her tar en switch metode inn parameter som skriver ut
     * kommandoene til main metoden.
     * While loopen holder programmet gående til du skriver exit.
     * Det brukes try og catch for å fange opp feilskriving i input.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BoligMarked bm = new BoligMarked();
        
        String valg = "no";
        
        while(!valg.trim().equalsIgnoreCase("exit")){
            
            valg = bm.getInput();
            
            if (valg.isEmpty()){
                System.out.println("Husk å skrive noe");
               }
            
        switch(valg){
            
            case "skriv alle":
                bm.skrivHus();
                break;
                
            case "legg til bolig":
                boolean success = false;
                int forsok = 0;
                do {
                    try {
                        
                        System.out.print("Gatenummer: ");
                        int nummerA = bm.getInputInteger();
                        
                        System.out.print("Gatenavn: ");
                        String navnA = bm.getInput();
                        
                        System.out.print("Pris: ");
                        int prisA = bm.getInputInteger();
                
                        System.out.print("Kvadratmeter: ");
                        int kvmA = bm.getInputInteger();
                
                        bm.leggTilBolig(nummerA, navnA, prisA, kvmA, true);
                        System.out.println("Lagt til i liste");
                        success = true;
                    }
                    catch (RuntimeException e){
                        System.out.println("Error! Skrev du alt riktig?");
                        forsok++;
                        if(forsok < 2){
                            System.out.println("Prøv på nytt");
                        }
                    }
                    
                }while(!success && forsok < 2);
                if (!success){
                    System.out.println("Du får bare 2 forsøk!\n"
                            + "du kan prøve igjen ved å skriv inn samme kommando");
                }
                 break;
                
            case "legg til leilighet":
                boolean success1 = false;
                int forsok1 = 0;
                do {
                    try {
                        System.out.print("Gatenummer: ");
                        int nummerB = bm.getInputInteger();
                        
                        System.out.print("Gatenavn: ");
                        String navnB = bm.getInput();
                
                        System.out.print("Pris: ");
                        int prisB = bm.getInputInteger();
                
                        System.out.print("Kvadratmeter: ");
                        int kvmB = bm.getInputInteger();
                
                        System.out.print("Blokknummer: ");
                        int blokk = bm.getInputInteger();
                        
                        System.out.print("Hvor i blokka: ");
                        String hvor = bm.getInput();
                
                        bm.leggTilLeilighet(nummerB, navnB, prisB, kvmB, blokk, hvor);
                        System.out.println("Lagt til i liste");
                        success1 = true;
                    }
                    catch (RuntimeException e){
                        System.out.println("Error! Skrev du alt riktig?");
                        forsok1++;
                        if(forsok1 < 2){
                            System.out.println("Prøv på nytt");
                        }
                    }
                    
                }while(!success1 && forsok1 < 2);
                if (!success1){
                    System.out.println("Du får bare 2 forsøk!\n"
                            + "du kan prøve igjen ved å skriv inn samme kommando");
                }
                break;
                
            case "hjelp":
                bm.meny();
                break;
                
            case "skriv boliger":
                bm.printKunBoliger();
                break;
                
            case "skriv leiligheter":
                bm.printKunLeiligheter();
                break;
                
            case "sok paa gatenavn":
                System.out.print("Gatennavn du vil søke på: ");
                String navnC = bm.getInput();
                        
                System.out.println("Her er resultatene fra: " + navnC);
                bm.finnHusPaaGatenavn(navnC);
                        
                break;
                
            case "sok paa hus":
                
                do {
                    try {
                        System.out.print("Gatenavn: ");
                        String navnD = bm.getInput();
                
                        System.out.print("Gatenummer: ");
                        int nummerD = bm.getInputInteger();
                        
                        bm.finnHusPaaGateOgNummer(navnD, nummerD);
                    }
                    catch (RuntimeException e){
                        System.out.println("Error! Skrev du alt riktig?");
                    }
                    
                    }while(valg.equalsIgnoreCase("nein"));
                break;
                
            case "ovre prisgrense":
                System.out.print("Skriv inn din makspris: ");
                do {
                    try {
                        int prisE = bm.getInputInteger(); 
                
                        System.out.println("Her er resultatene for maks: " + prisE + " kr");
                        bm.finnHusBilligereEnn(prisE);
                    }
                    catch (RuntimeException e){
                        System.out.println("Error! Skrev du alt riktig?");
                    }
                    
                }while(valg.equalsIgnoreCase("nein"));
                break;
              
            case "slett hus": 
                System.out.println("Skriv inn adressen på huset du vil slette ");
                do {
                    try {
                        System.out.print("Gatenavn: ");
                        String gateF = bm.getInput();
                
                        System.out.print("Gatenummer: ");
                        int nummerF = bm.getInputInteger();
                
                        bm.slettEttHus(gateF, nummerF);
                    }
                    
                    catch (RuntimeException e) {
                        System.out.println("Error! Skrev du alt riktig?");
                    }
                    
                } while(valg.equalsIgnoreCase("nein"));
                break;
                
            case "slett gate":
                System.out.println("Skriv inn adressen på gaten for å");
                System.out.println("slette alle husene i gaten");
                System.out.print("Gatenavn: ");
                
                String gateG = bm.getInput();
                bm.slettAlleHusPaaGatenavn(gateG);
                break;
                
            case "ovre kvadrat":
                System.out.print("Skriv inn maks kvadratmeter: ");
                do {
                    try {
                        int kvadrat = bm.getInputInteger(); 
                
                        System.out.println("Her er resultatene for maks: " + kvadrat + " kvm");
                        bm.HusMindreEnnKvadrat(kvadrat);
                    }
                    
                    catch (RuntimeException e){
                        System.out.println("Error! Skrev du alt riktig?");
                    }
                }while(valg.equalsIgnoreCase("nein"));
                break;
                
            case "testdata bolig":
                System.out.print("Skriv inn antall testdata(boliger): ");
                do {
                    try {
                        int test1 = bm.getInputInteger();
                
                        bm.leggTilTestDataBolig(test1);
                        System.out.println("Du har lagt til: " + test1 + " boliger");
                    }
                    catch (RuntimeException e){
                        System.out.println("Error! Skrev du alt riktig?");
                    }
                }while(valg.equalsIgnoreCase("nein"));
                break;
                
            case "testdata leilighet":
                System.out.print("Skriv inn antall testdata(leiligheter): ");
                do {
                    try {
                        int test2 = bm.getInputInteger();
                
                        bm.leggTilTestDataLeilighet(test2);
                        System.out.println("Du har lagt til: " + test2 + " leiligheter");
                    }
                    catch (RuntimeException e){
                        System.out.println("Error! Skrev du alt riktig?");
                    }
                }while(valg.equalsIgnoreCase("nein"));
                break;
                
        }
        
      }
   }
}
    
