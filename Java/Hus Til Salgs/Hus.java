
/**
 * Simulerer et hus på markedet
 * 
 * @author Mathias Nygård Evensen 
 * @version 0.1
 */
public class Hus
{
    private int streetNumber;
    private String streetName;
    private int price;
    private String type;      //what type of house it is ex. Condo, Apartment, House etc
    private int squareMeter;
    private boolean garage;   // True if it has a garage, else false
    private String ownership; // states if you own or rent it
    public Hus()
    {
        streetNumber = 88;
        streetName = "Greisdalsveien";
        price = 4500000;
        type = "Hus";
        squareMeter = 240;
        garage = true;
        ownership = "kjøpe";
    }
    
    public Hus(int streetNumber, String streetName, int price, int squareMeter)
    {
        this.streetNumber = streetNumber;
        this.streetName = streetName;
        this.price = price;
        this.squareMeter = squareMeter;
    }
    
    public Hus(int streetNumber, String streetName, int price, String type, int squareMeter, boolean garage, String ownership)
    {
        this.streetNumber = streetNumber;
        this.streetName = streetName;
        this.price = price;
        this.type = type;
        this.squareMeter = squareMeter;
        this.garage = garage;
        this.ownership = ownership;
    }
    
    public void houseAndNumber()
    {
        System.out.println(""+ streetName +" "+ streetNumber +"");
    }
    
    public int streetNumber()
    {
        return streetNumber;
    }
    
    public String streetName()
    {
        return streetName;
    }
    
    public int getPris()
    {
        return price;
    }
    
    public void getPrice()
    {
        System.out.println(+ price + " Kroner");
    }
    
    public String getType()
    {
        return type;
    }
    
    public int squareMeter()
    {
        return squareMeter;
    }
    
    public boolean garage()
    {
        return garage;
    }
    
    public String ownership()
    {
        return ownership;
    }
    
    public void printHouses()
    {
        System.out.println("Navnet på gaten: " + streetName);
        System.out.println("Nummeret på gaten: " + streetNumber);
        System.out.println("Prisen på huset " + price + " Kroner");
        System.out.println("Type hus: " + type);
        System.out.println("Husets areal: " + squareMeter + " kvadratmeter");
        System.out.println("Om huset har en garasje: " + garage);
        System.out.println("Hvordan er eiermuligheten: " + ownership);
        System.out.println("Hvis null vises på type, garasje og eiermulighet er det en liste med mindre info");
        System.out.println("");
    }
    
}
