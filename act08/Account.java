// NAME: Elijah Morris
// ASGT: Activity 8
// ORGN: CSUB - CMPS 3500
// FILE: Account.java
// DATE: 5/3/2022

public class Account {
    private double balance;

    // Overloaded constructor to set the initial balance   
    public Account(double initialBalance) {
        if (initialBalance > 0.0) { 
            balance = initialBalance;
        }
    }

    // Add credit to the balance 
    public void credit(double amount){
        this.balance = this.balance + amount;
    }  

    // Subtract debit from the balance 
    public void debit(double amount){
        // If the amount being subtracted exceeds the amount available, display a message 
        // and leave the balance alone
        if(this.balance - amount < 0) {
            System.out.println("!!! Debit amount exceeded account balance !!!\n");
        }
        else {
            this.balance  = this.balance - amount;
        }

    }  

    // Get the current balance of an account
    public double getBalance(){
        return balance;
    }
}
