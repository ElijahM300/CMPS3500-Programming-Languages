// NAME: Elijah Morris
// ASGT: Activity 8
// ORGN: CSUB - CMPS 3500
// FILE: AccountMain.java
// DATE: 5/3/2022

import java.util.Scanner;

public class AccountMain {
    // Main driver function and entry point for the program
    public static void main(String[] args) {
        // Main variables to be used 
        Account a1 = new Account(50);
        Account a2 = new Account(50);
        Scanner myScanner = new Scanner(System.in);
        
        // Output adding to Account 1
        System.out.println("Current Balances:");
        System.out.println("****************");
        System.out.print("Account 1 Balance: $");
        System.out.format("%.2f", a1.getBalance());
        System.out.print("\nAccount 2 Balance: $");
        System.out.format("%.2f", a2.getBalance());
        System.out.print("\n\nEnter a deposit amount for Account 1: ");
        // Get user input
        double userInput = myScanner.nextDouble();
        System.out.print("\nAdding $");
        System.out.format("%.2f", userInput); 
        System.out.print(" to Account 1 balance\n\n");
        // Update balance 
        a1.credit(userInput);

        // Output adding to Account 2
        System.out.println("Current Balances:");
        System.out.println("****************");
        System.out.print("Account 1 Balance: $");
        System.out.format("%.2f", a1.getBalance());
        System.out.print("\nAccount 2 Balance: $");
        System.out.format("%.2f", a2.getBalance());
        System.out.print("\n\nEnter a deposit amount for Account 2: ");
        // Get user input
        userInput = myScanner.nextDouble();
        System.out.print("\nAdding $");
        System.out.format("%.2f", userInput); 
        System.out.print(" to Account 2 balance\n\n");
        // Update balance 
        a2.credit(userInput);

        // Output subtracting from Account 1
        System.out.println("Current Balances:");
        System.out.println("****************");
        System.out.print("Account 1 Balance: $");
        System.out.format("%.2f", a1.getBalance());
        System.out.print("\nAccount 2 Balance: $");
        System.out.format("%.2f", a2.getBalance());
        System.out.print("\n\nEnter a debit amount for Account 1: ");
        // Get user input
        userInput = myScanner.nextDouble();
        System.out.print("\nSubtracting $");
        System.out.format("%.2f", userInput); 
        System.out.print(" from Account 1 balance\n\n");
        // Update balance 
        a1.debit(userInput);

        // Output subtracting from Account 2
        System.out.println("Current Balances:");
        System.out.println("****************");
        System.out.print("Account 1 Balance: $");
        System.out.format("%.2f", a1.getBalance());
        System.out.print("\nAccount 2 Balance: $");
        System.out.format("%.2f", a2.getBalance());
        System.out.print("\n\nEnter a debit amount for Account 2: ");
        // Get user input
        userInput = myScanner.nextDouble();
        System.out.print("\nSubtracting $");
        System.out.format("%.2f", userInput); 
        System.out.print(" from Account 2 balance\n\n");
        // Update balance 
        a2.debit(userInput);

        // Output showing the final balances 
        System.out.println("Current Balances:");
        System.out.println("****************");
        System.out.print("Account 1 Balance: $");
        System.out.format("%.2f", a1.getBalance());
        System.out.print("\nAccount 2 Balance: $");
        System.out.format("%.2f", a2.getBalance());
        System.out.print("\n");
    }

}
