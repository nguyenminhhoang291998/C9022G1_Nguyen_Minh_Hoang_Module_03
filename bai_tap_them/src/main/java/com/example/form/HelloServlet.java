package com.example.form;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

//    public Map<String,String> checkValida(Facility facility){
//        Map<String,String> errorMap = new HashMap<>();
//        if(facility.getCost() < 0){
//            errorMap.put("cost","Tiền phải lớn hơn 0");
//        }
//        if(facility.getNumberOfFloors() < 0){
//            errorMap.put("numberOfFloors","Số tầng phải lớn hơn 0");
//        }
//        return errorMap;
//    }

    public void destroy() {
    }

    /* Format YYYY-MM-dd */
//   /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/

/* Format dd-MM-YYYY hoặc
               dd.MM.YYYY hoặc
               dd/MM/YYYY
   và kiểm tra năm nhuận */
//            /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/

}

// Chữ cái và số không bao gồm khoảng trắng
//           /^[a-zA-Z0-9]*$/

// Chữ cái và số có bao gồm khoảng trắng
//        /^[a-zA-Z0-9 ]*$/