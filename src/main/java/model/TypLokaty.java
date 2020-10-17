package model;

public class TypLokaty {
    private int dni;

    public int getDni() {
        return dni;
    }

    public double getOprocentowanie() {
        return oprocentowanie;
    }

    private double oprocentowanie;

    public TypLokaty(int dni, double oprocentowanie) {
        this.dni = dni;
        this.oprocentowanie = oprocentowanie;
    }
}
