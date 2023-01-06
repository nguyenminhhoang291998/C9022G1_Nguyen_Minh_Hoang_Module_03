public class QuadraticEquation {
    public static void main(String[] args) {

    }

    public static String quadraticEquation(int a,int b, int c){
        String result ="";
        if(a ==0){
            result = "Đây không phải là phương trình bậc 2";
        }else {
            double delta = Math.pow(b,2) - 4*a*c;
            if(delta < 0){
                result = "Phương trình vô nghiệm.";
            }else if(delta == 0){
                result = "Phương trình có 2 nghiệm kép là: " + (-b/(2*a));
            }else {
                result = "Phương trình có 2 nghiệm là: " + ((-b+Math.sqrt(delta))/(2*a))
                        + " và " +  ((-b-Math.sqrt(delta))/(2*a)) ;
            }
        }
        return result;
    }
}
