/**
 *
 * @author Mathias
 */
public class FizzBuzz {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int i=1;
        
        for(i = 1; i <= 100; i++){
            String output = "";
            
            if(i%3 == 0){
                output += "Fizz";
            }
            if(i%5 == 0){
                output += "Buzz";
            }
            
            if(output == ""){
                System.out.print(i);
            }
            System.out.println(output);
        }
    }
    
}
