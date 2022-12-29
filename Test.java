import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();

        for (int i = 0; i < n / 2; i++) {
            for (int j = 0; j < i; j++) {
                System.out.print(" ");
            }
            for (int l = 0; l < n - i * 2; l++) {
                System.out.print("*");
            }
            System.out.println();
        }

        for (int i = 0; i < n / 2; i++) {
            for (int j = 0; j < n / 2 - i - 1; j++) {
                System.out.print(" ");
            }
            for (int l = 0; l < i * 2 + 2; l++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}
