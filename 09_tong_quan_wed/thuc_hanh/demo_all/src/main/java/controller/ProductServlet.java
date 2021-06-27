package controller;

import model.bean.Category;
import model.bean.Product;
import model.service.IProductService;
import model.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request,response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "search":
                searchProduct(request,response);
                break;
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "create":
                showFormCreate(request,response);
                break;
            case "edit":
                showFormEdit(request,response);
                break;
            default:
                showList(request,response);
                break;
        }
    }



    //doPost
    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int idCategory = Integer.parseInt(request.getParameter("category"));
        Product product = new Product(name,price,quantity,color,description,idCategory);
        boolean check = false;
        check = productService.insertProduct(product);
        if (check){
            request.setAttribute("message","Create Success");
        }else {
            request.setAttribute("message","Create Fail");
        }
        List<Category> categories = productService.findAllCategory();
        request.setAttribute("categorys",categories);
        try {
            request.getRequestDispatcher("/view/product/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int idCategory = Integer.parseInt(request.getParameter("category"));
        Product product = new Product(name,price,quantity,color,description,idCategory);
        boolean check = false;
        check = productService.updateProduct(idProduct,product);
        if (check){
            request.setAttribute("message","Edit Success");
        }else {
            request.setAttribute("message","Edit Fail");
        }
        request.setAttribute("product",product);
        List<Category> categories = productService.findAllCategory();
        request.setAttribute("categorys",categories);
        try {
            request.getRequestDispatcher("/view/product/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        productService.deleteProduct(id);
        try {
            response.sendRedirect("/products");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        List<Product> productList = productService.searchByName(name);
        List<Category> categories = productService.findAllCategory();
        request.setAttribute("products",productList);
        request.setAttribute("categorys",categories);
        try {
            request.getRequestDispatcher("/view/product/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




    //doGet
    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = productService.findAllProduct();
        List<Category> categories = productService.findAllCategory();
        request.setAttribute("products",products);
        request.setAttribute("categorys",categories);
        try {
            request.getRequestDispatcher("/view/product/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<Category> categories = productService.findAllCategory();
        request.setAttribute("categorys",categories);
        try {
            request.getRequestDispatcher("/view/product/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        List<Category> categories = productService.findAllCategory();
        request.setAttribute("categorys",categories);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("/view/product/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}