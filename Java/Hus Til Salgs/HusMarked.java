import java.util.ArrayList;
import java.util.Iterator;
/**
 * Dette skal simulere et marked der alle husene som er til salgs ligger.
 * 
 * @author Mathias Nygård Evensen 
 * @version 0.1
 */
public class HusMarked
{
    private String nameMarked;
    private ArrayList<Hus> hus;
    
    /**
     * Constructor for objects of class HusMarked
     */
    public HusMarked()
    {
       nameMarked = "Evensen house market®";
       this.nameMarked = nameMarked;
       hus = new ArrayList<Hus>();
    }
    
    /**
     * Legge til huset som er laget fra grunnen av
     */
    public void addHouse(Hus newHus)
    {
        hus.add(newHus);
    }
    
    /**
    * Legge til et hus manuelt med mindre informasjon enn det andre
    */ 
    public void addOwnHouseLessInfo (int streetNumber, String streetName, int price, int squareMeter)
    {
        Hus newHus;
        newHus = new Hus(streetNumber, streetName, price, squareMeter);
        hus.add(newHus);
    }
    
    /**
     * Legge til et hus manuelt med all informasjonen som trengs
     */
    public void addOwnHouse (int streetNumber, String streetName, int price, String type, int squareMeter, boolean garage, String ownership)
    {
        Hus newHus;
        newHus = new Hus(streetNumber, streetName, price, type, squareMeter, garage, ownership);
        hus.add(newHus);
    }
    
    /**
     * Printer alle hus som er i husmarkedet
     */
    public void printAllHouses()
    {
        System.out.println("Husene til salgs hos " + nameMarked);
        System.out.println("=====================================================");
        if (hus.size() == 0) {
            System.out.println("Ingen hus til salgs akkurat nå, kom tilbake senere :)");
        }
        for (Hus Hus : hus) {
            Hus.printHouses();
            System.out.println("");
        }
        System.out.println("Antall hus på markedet "+hus.size());
        System.out.println();
    }
    
    public int getAntallHus()
    {
        return hus.size();
    }
    
    /**
     * finner alle husene som er i et gitt gatenavn
     */
    public void findHousesOnStreetname(String searchString)
    {
         int looper = 0;
         int antall = hus.size();
         Hus etHus;
         for (Hus aHus : hus) {
           etHus = hus.get(looper);
           if(etHus.streetName().equalsIgnoreCase(searchString)) {
               etHus.printHouses();               
           }
           looper++;
         }
    }
    
    /**
    * Finn et hus med indexnummer
    */
    public void getHouseInList(int index)
    {
       Hus etHus = hus.get(index);
       boolean searching = true;
       int looper = 0;
        while (searching && looper <= hus.size()) {
        if (hus.size() >= 0 && index <= hus.size()) { 
           searching = false;
           etHus.printHouses();
        }
         else {
           looper++;
        }
       }

    }

    /**
     * Finner indexen på det første huset i et gitt gatenavn
     * @return -1 viss det ikke var noen match
     */
    public int findFirstHouseIndexOnStreet (String searchString)
    {
        int looper = 0;
        boolean searching = true;
        int size = hus.size();
        Hus etHus;
        while (searching && looper < hus.size()) {
            etHus = hus.get(looper);
            if (etHus.streetName().equalsIgnoreCase(searchString)) {
                searching = false;
            }
            else {
                looper++;
            }
        }
        if (searching) {
            return -1;
        }
        else {
            return looper;
        }
    }
    
    /**
     * Finne hus som er dyrere enn en prisgrense
     */
    public void findHousesMoreExpensiveThan(int lowerLimit)
    {
        int counter;
        int numberOf = hus.size();
        Hus etHus;
        for (counter = 0; counter < numberOf; counter++) {
            etHus = hus.get(counter);
            if (etHus.getPris() >= lowerLimit) {
                etHus.printHouses();
            }
        }
    }
    
    /**
     * Slette ett hus ved å søke på gate og gatenummer
     */
    public void removeOneHouse(String searchString, int number)
    {
        for (Iterator<Hus> it = hus.iterator(); it.hasNext();) {
            Hus etHus = it.next();
            if (etHus.streetName().equalsIgnoreCase(searchString)
            && etHus.streetNumber() == number) {
                it.remove();
            }
        }
    }
    
    /**
     * Slette alle hus på ett gatenavn
     */
    public void deletAlleHousesOnStreetname(String searchString)
    {
        Iterator<Hus> it;
        it = hus.iterator();
        int numberRemoved = 0;
        while (it.hasNext()) {
            Hus etHus = it.next();
            if (etHus.streetName().contains(searchString)) {
                it.remove();
                numberRemoved++;
            }
        }
        System.out.println("Du har slettet: " +numberRemoved+ " hus");
    }
    
    /**
     * Finner hus som er større enn et gitt nummer kvadratmeter
     */
    public void housesLargerThanSetSquaremeters (int lowerLimit)
    {
        for (Iterator<Hus> it = hus.iterator(); it.hasNext();) {
            Hus etHus = it.next();
            if (etHus.squareMeter() >= lowerLimit) {
                etHus.printHouses();
            }
        }
    }
    
    /**
    * Test data slik at du slipper å legge inn hus forhånd.
    */
    public boolean addTestData(int numberOf)
    {
       int putInn = 0;
       int random2 = 0;
       int random = 1; 
       Hus ny;
       int price = 2500000;
       int streetNumber = putInn;
       String streetName = "A";
       int squareMeter = 100;
       boolean tooManyHouses = true;
       if (numberOf > 15 || numberOf < 1 && tooManyHouses) {
               System.out.println("Du kan ikke legge til flere enn 15 hus om gangen");
               System.out.println("eller legge til mindre enn 1");
               return false;
            }
       while (putInn < numberOf && numberOf <= 15 && tooManyHouses) {
           streetNumber = putInn;
           price = 25000000/100 + 2500*random++;
           squareMeter = 100 + 5*random2++;
           ny = new Hus(streetNumber, streetName, price, squareMeter);
           hus.add(ny);
           putInn++;
        }
        return true;
    }
   
    /**
    * Test data med en nytt gatenavn og litt annerledes pris og kvaratmeter i motsetning til addTestData1
    * Satte inn feile verdier med vilje for å sjekke Test funksjonene;
    * Se på addTestData for å se hvordan det egentlig skal se ut
    */
    public boolean addTestData2(int numberOf)
    {
       int putInn = 0;
       int random2 = 0;
       int random = 1;
       Hus ny;
       int price = 3500000;
       int streetNumber = putInn;
       String streetName = "B";
       int squareMeter = 200;
       boolean tooManyHouses = true;
       if (numberOf > 15 || numberOf < 1) {
               System.out.println("Du kan ikke legge til flere enn 15 hus om gangen");
               System.out.println("eller legge til mindre enn 1");
               return true;
            }
       while (putInn < numberOf && numberOf <= 15) {
           streetNumber = putInn;
           price = 35000000/100 + 3500*random++;
           squareMeter = 200 + 5*random2++;
           ny = new Hus(streetNumber, streetName, price, squareMeter);
           hus.add(ny);
           putInn++;
        }
        return false;
   }
   
}
