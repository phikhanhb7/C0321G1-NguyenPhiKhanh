package models.common;

import models.bean.Customer;
import models.repository.customer.CustomerRepository;
import models.repository.customer.ICustomerRepository;

public class Validate {
    public static final String CUSTOMER_CODE = "^(KH-)[0-9]{4}$";
    public static final String SERVICE_CODE = "^(DV-)[0-9]{4}$";
    public static final String PHONE_NUMBER = "^(090|091|\\(84\\)\\+90|\\(84\\)\\+91)[0-9]{7}$";
    public static final String ID_CARD = "^([0-9]{9}|[0-9]{12}$)";
    public static final String DAY_DD_MM_YYYY = "^([0][1-9]|[12][0-9]|[3][01])[/]([0][1-9]|[1][012])[/]([1][0-9]{3}|[2][0-9]{3})$";
    public static final String DAY_YYYY_MM_DD = "^(19[0-9]{2}|20[0-9]{2})-[01][0-9]-[0123][0-9]$";
    public static final String INTERGER = "^[0-9]+$";
    public static final String DOUBLE = "^[0-9]+\\.?[0-9]*$";
    public static final String NAME = "^[\\p{L} .'-]+$";
    public static final String EMAIL = "^\\w+((_|\\.)?\\w+)*@\\w+(\\.\\w+){1,3}$";
    private static ICustomerRepository customerRepository = new CustomerRepository();

    public static String checkCustomerCode(String customerCode) {
        boolean check = customerCode.matches(CUSTOMER_CODE);
        String CheckCustomerCode = "";
        if ("".equals(customerCode)){
            CheckCustomerCode = "Please input code of customer";
        }else if (!check) {
            CheckCustomerCode = "Customer Code is form KH-XXXX (X is number from 0-9)";
        }
        Customer checkNull= customerRepository.findByCode(customerCode);
        if (checkNull != null) {
            CheckCustomerCode= "Customer Code is already exist";
        }
        return CheckCustomerCode;
    }
    public static String checkPhoneNumber(String PhoneNumber) {
        boolean check = PhoneNumber.matches(PHONE_NUMBER);
        String checkPhoneNumber = "";
        if ("".equals(PhoneNumber)) {
            checkPhoneNumber = "Please input phone of customer";
        } else if (!check) {
            checkPhoneNumber = "Phone number must be in the format 090xxxxxxx or 091xxxxxxx or (84) + 90xxxxxxx or (84) + 91xxxxxxx)";
        }
        return checkPhoneNumber;
    }
    public static String checkIdCard(String idCard) {
        boolean check = idCard.matches(ID_CARD);
        String checkIdCard = "";
        if (idCard.equals("")){
            checkIdCard = "Please input idCard of customer";
        }else if (!check) {
            checkIdCard = "The ID number must be in the format XXXXXXXXX or XXXXXXXXXXXX (X is the number 0-9)";
        }
        return checkIdCard;
    }
    public static String checkEmail(String email) {
        boolean check = email.matches(EMAIL);
        String checkEmail = "";
        if (email.equals("")){
            checkEmail = " Please input email of customer" ;
        }else if (!check) {
            checkEmail = "Email must be in the correct format abc@abc.abc";
        }
        return checkEmail;
    }
    public static String checkDay(String day) {
        boolean check = day.matches(DAY_YYYY_MM_DD);
        String checkDay = "";
        if ("".equals(day)){
            checkDay = " Please input birthDay of customer";
        } else if (!check) {
            checkDay = "date and time format in the format DD / MM / YYYY";
        }
        return checkDay;
    }
    public static String checkNumberInterger(String number) {
        boolean check = number.matches(INTERGER);
        String checkNumberInterger = "";
        if (!check) {
            checkNumberInterger = "enter a positive integer";
        }
        return checkNumberInterger;
    }
    public static String checkNumberDouble(String number) {
        boolean check = number.matches(DOUBLE);
        String checkNumberDouble = "";
        if ("".equals(number)){
            checkNumberDouble = " Please input Salary of customer";
        }else if (!check) {
            checkNumberDouble = "enter positive real numbers (ex : 300000)";
        }
        return checkNumberDouble;
    }
    public static String checkName(String name) {
        boolean check = name.matches(NAME);
        String checkName = "";
        if("".equals(name)){
            checkName="Please input ";
        }else if (!check) {
            checkName ="Name invalid";
        }

        return checkName;
    }



}
