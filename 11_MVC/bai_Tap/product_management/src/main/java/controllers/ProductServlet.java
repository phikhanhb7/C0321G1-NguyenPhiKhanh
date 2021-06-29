package controllers;

import models.bean.Product;
import models.service.IProduct;
import models.service.impl.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"","/product"})
public class ProductServlet extends HttpServlet {

    private IProduct products = new ProductServiceImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request,response);
                break;
//            case "delete":
//                deleteProduct(request,response);
//                break;
            case "search":
                searchProduct(request,response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }
//
//    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Product product = this.products.findById(id);
//        request.setAttribute("product",product);
//        if (product != null ){
//            this.products.remove(id);
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product");
//            try {
//                response.sendRedirect("/product");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String discription = request.getParameter("discription");

        Product product = this.products.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {

            product.setName(name);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setColor(color);
            product.setDiscription(discription);

            this.products.update(id, product);
            request.setAttribute("product", product);
            request.setAttribute("message", "Product information was updated");
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String discription = request.getParameter("discription");


        Product product = new Product(id, name, price, quantity,color,discription);
        this.products.save(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        request.setAttribute("message", "New Product was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditProduct(request,response);

                break;
            case "delete":
                deleteProduct(request,response);

                break;
            case "view":
                viewProduct(request, response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        products.remove(id);
        response.sendRedirect("/product");
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("product", products.findById(id));
        try {
            request.getRequestDispatcher("product/view.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }


    }


//    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) {
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/delete.jsp");
//        int id = Integer.parseInt(request.getParameter("id"));
//        Product product = this.products.findById(id);
//        request.setAttribute("product",product);
//        try {
//            requestDispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//    }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

            request.setAttribute("product", products.findById(id));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/edit.jsp");
            requestDispatcher.forward(request,response);


    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("product/create.jsp");

    }


    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("products",products.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");

        request.setAttribute("products",products.findByName(name));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/list.jsp");
        requestDispatcher.forward(request, response);
    }


}
