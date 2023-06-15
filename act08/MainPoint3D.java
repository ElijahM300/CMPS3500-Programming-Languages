// NAME: Elijah Morris
// ASGT: Activity 8
// ORGN: CSUB - CMPS 3500
// FILE: MainPoint3D.java
// DATE: 5/3/2022

public class MainPoint3D {
    public static void main(String[] args) {
        //creating a new oject point with corrdinates (0, 0) 
		Point3D origin = new Point3D();

        //creating mote object points
		Point3D p1 = new Point3D(1, 2, 3);
        Point3D p2 = new Point3D(3, 4, 5);
        Point3D p3 = new Point3D(6, 7, 0);
        Point3D p4 = p1;
		double d12; 
        double area;

        //printing all points
		System.out.println("\nObjects (Points) created from Point3D class:");
		System.out.println("p1: " + p1);
		System.out.println("p2: " + p2);
		System.out.println("p3: " + p3);
		System.out.println("p4: " + p4);
		
		//comparing some points
		System.out.println("\nComparing Points:");
		System.out.println("p1 == p1? " + (p1 == p1));
        System.out.println("p1 == p2? " + (p1 == p2));
        System.out.println("p2 == p3? " + (p2 == p3));
        System.out.println("p1 == p4? " + (p1 == p4));

		//caluclatin the distance between p1 and p2
		d12 = p1.distance(p2);
        area = origin.computeArea(p1, p2, p3);
		System.out.println("\nThe distance between p1 and p2 is: " + d12);
        System.out.println("The area of the triangle formed by p1, p2, and p3 is: " + area);

		// Setting new coordinates on point 1
        System.out.println("\nSetting new coordinates for point 1: ");        
        p1.setX(-99);
		p1.setY(-1);
        p1.setZ(3);
        System.out.println("p1: " + p1);
  	
        System.out.println("\nChanging some values at the object level:");
		// changing the value of x of p1 changes it at the object level.
        // p4 refers to the same object so printing p4 will see the new
        // value too.
        p1.setX(5);

        // Setting p1 equal to a new Point3D only changes what p1 points too.
        // p4 still points to the original Point3D object.
        p1 = new Point3D(10, 11, 12);

        System.out.println("p1: " + p1);
        System.out.println("p4: " + p4);

        System.out.println("p1.equals(p1)? " + p1.equals(p1));
        System.out.println("p1.equals(p2)? " + p1.equals(p2));
        System.out.println("p2.equals(p3)? " + p2.equals(p3));
        System.out.println("p1.equals(p4)? " + p1.equals(p4));


		
		
    }
}
