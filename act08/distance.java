// NAME: Elijah Morris
// ASGT: Activity 8
// ORGN: CSUB - CMPS 3500
// FILE: distance.java
// DATE: 5/2/2022

// Imports for the reading in the file
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner; 

public class distance {
    // Main entry point for the program 
    public static void main(String[] args) {
        // Main variables to be used in the program
        int x = 0;
        int y = 0;
        int numOfPoints = 0;
        double minDist = 10;
        double maxDist = 0;
        double curDist = 0;
        int minP1 = 0; 
        int minP2 = 0; 
        int maxP1 = 0; 
        int maxP2 = 0;
        Point[] points = new Point[1000]; 

        // Try to open the file and read it
        try {
            File myFile = new File("inputpoint.txt");
            Scanner myScanner = new Scanner(myFile);
            // Loop through the file and store the points in an array
            while(myScanner.hasNextLine()) {
                String data[] = myScanner.nextLine().split("\\s+");
                x = Integer.valueOf(data[0]);
                y = Integer.valueOf(data[1]);
                points[numOfPoints] = new Point(x, y);
                numOfPoints++;
            } 
            myScanner.close();
          // Catch an exception if the file could not be found 
        } catch (FileNotFoundException e){
            System.out.println("Sorry, that file could not be found.\n");
            e.printStackTrace();
        }

        // Loop through the array of points to find the max and min distances 
        for(int i = 0; i < numOfPoints - 1; i++) {
            curDist = points[i].distance(points[i + 1]);
            // If the cur dist is less than the min dist, set the min dist to the cur dist
            // and save the points where the min occurs
            if(curDist < minDist) {
                minDist = curDist;
                minP1 = i;
                minP2 = i + 1;
            } 
            // If the cur dist is more than the max dist, set the max dist to the cur dist
            // and save the points where the max occurs
            else if(curDist > maxDist) {
                maxDist = curDist;
                maxP1 = i;
                maxP2 = i + 1;
            }
        }
        // Output for the program 
        System.out.println("Closest Points:");
        System.out.println("***************");
        System.out.println(points[minP1] + " and " + points[minP2] + 
        " are the closest points in inputpoint.txt at a minimum distance of: " + minDist + ".\n");
        System.out.println("Farthest Points:");
        System.out.println("****************");
        System.out.println(points[maxP1] + " and " + points[maxP2] + 
        " are the farthest points in inputpoint.txt at a maximum distance of: " + maxDist + ".\n");

    }
}
