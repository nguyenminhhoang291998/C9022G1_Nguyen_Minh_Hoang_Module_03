package com.example.calculator;

public class Calculator {
    public void calculate(double number) throws CalculatorException {
        if(number==0){
            throw new CalculatorException();
        }
    }
}
