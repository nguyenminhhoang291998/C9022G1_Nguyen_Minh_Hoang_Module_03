package com.example.calculator;

public class CalculatorException extends Exception {

    public CalculatorException() {
        super("Không thể chia cho 0");
    }
}
