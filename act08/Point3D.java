// NAME: Elijah Morris
// ASGT: Activity 8
// ORGN: CSUB - CMPS 3500
// FILE: Point3D.java
// DATE: 5/3/2022

public class Point3D {
    private int x;
    private int y;
    private int z;

    // New points default to zero zero if no coordinates
    // are provided.
    public Point3D() {
        // we call the regular constructor inside
        // the zero-arg constructor to reduce redundancy
        this(0, 0, 0);
    }

    // Overloaded constructor that sets x, y, and z 
    public Point3D(int x, int y, int z) {
        setX(x);
        setY(y);
        setZ(z);
    }

    //Defining some motheods
	//**********************
	
	//Extract X Coordinate from a point object
	public int getX() {
        return x;
    }
	
	//Set X Coordintate of a point object
    public void setX(int x) {
        this.x = x;
    }
	
	//Extract Y Coordinate from a point object
    public int getY() {
        return y;
    }

	//Set Y Coordintate of a point object
    public void setY(int y) {
        this.y = y;
    }

	//Extract Z Coordinate from a point object
    public int getZ() {
        return z;
    }

	//Set Z Coordintate of a point object
    public void setZ(int z) {
        this.z = z;
    }

	//Find the distance beqtween 2 points
    public double distance(Point3D p2) {
        int dx = this.x - p2.x;
        int dy = this.y - p2.y;
        int dz = this.z - p2.z;
        return Math.sqrt(dx * dx + dy * dy + dz * dz);
    }

    //Find the area that is created by three points using Heron's formula 
    public static double computeArea(Point3D p1, Point3D p2, Point3D p3) {
        double a = p1.distance(p2);
        double b = p2.distance(p3);
        double c = p3.distance(p1); 
        double s = (a + b + c) / 2;
        return Math.sqrt(s * (s - a) * (s - b) * (s - c));
         
    }

	//Compares 2 points and returns True if the points are equal and returns False otrherwise
    public boolean equals(Object other) {
        if (other == null) return false;
        if (other == this) return true;
        if (!(other instanceof Point))return false;

        Point3D p2 = (Point3D)other;
        return (this.x == p2.x) && (this.y == p2.y) && (this.z == p2.z);
    }
	
	
	//convert point to string
    public String toString() {
        return "(" + this.x + "," + this.y + "," + this.z + ")";
    }
}
