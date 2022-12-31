package com.example.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculatorServlet")
public class CalculatorServlet extends HttpServlet {
    Calculator calculator = new Calculator();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operator = request.getParameter("operator");
        double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
        double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));
        String resultString="";
        switch (operator){
            case "addition":
                 resultString = firstOperand + " + " +secondOperand +" = "+ (firstOperand + secondOperand);
                 break;
            case "subtraction":
                resultString = firstOperand + " - " +secondOperand +" = "+ (firstOperand - secondOperand);
                break;
            case "multiplication":
                resultString = firstOperand + " * " +secondOperand +" = "+ (firstOperand * secondOperand);
                break;
            case "division":
                try {
                    calculator.calculate(secondOperand);
                    resultString = firstOperand + " / " +secondOperand +" = "+ (firstOperand / secondOperand);
                    break;
                }catch (CalculatorException e){
                    resultString = e.getMessage();
                }
        }
        request.setAttribute("result",resultString);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }
}
