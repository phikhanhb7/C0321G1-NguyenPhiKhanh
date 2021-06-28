import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculateServlet", urlPatterns = "/calculator")
public class CalculateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double result = 0;
        try{
            double firstOperand = Double.parseDouble(request.getParameter("first"));
            double secondOperand = Double.parseDouble(request.getParameter("second"));

            String operator = request.getParameter("operator");
            switch (operator){
                case "Addition":
                    result = firstOperand + secondOperand;
                    break;
                case "Subtraction":
                    result = firstOperand - secondOperand;
                    break;
                case "Multiplication":
                    result = firstOperand * secondOperand;
                    break;
                case "Division":
                    try{
                        if(secondOperand==0){
                            throw new Exception("Lỗi chia cho 0");
                        }
                        result = firstOperand / secondOperand;
                    }catch (Exception e){
                        request.setAttribute("result",e.getMessage());
                        request.getRequestDispatcher("display.jsp").forward(request,response);
                    }
                    break;
            }

        }catch (Exception e){
            request.setAttribute("result",e.getMessage());
            request.getRequestDispatcher("display.jsp").forward(request,response);
        }
        request.setAttribute("result",result);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }

}
