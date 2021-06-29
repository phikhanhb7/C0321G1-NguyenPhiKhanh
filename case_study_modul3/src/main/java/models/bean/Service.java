package models.bean;

public class Service {
    private int serviceId ;
    private String serviceName ;
    private int serviceArea ;
    private double serviceCost ;
    private int serviceMaxPeople ;
    private String serviceStandardRoom;
    private String serviceDescriptionOtherConvenience ;
    private double servicePollArea ;
    private int serviceNumberOfFloors ;

    private int serviceTypeId ;
    private int serviceRentTypeId ;

    public Service(int serviceId, String serviceName, int serviceArea, double serviceCost, int serviceMaxPeople,
                   String serviceStandardRoom, String serviceDescriptionOtherConvenience, double servicePollArea,
                   int serviceNumberOfFloors, int serviceTypeId, int serviceRentTypeId) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.serviceStandardRoom = serviceStandardRoom;
        this.serviceDescriptionOtherConvenience = serviceDescriptionOtherConvenience;
        this.servicePollArea = servicePollArea;
        this.serviceNumberOfFloors = serviceNumberOfFloors;
        this.serviceTypeId = serviceTypeId;
        this.serviceRentTypeId = serviceRentTypeId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getServiceArea() {
        return serviceArea;
    }

    public void setServiceArea(int serviceArea) {
        this.serviceArea = serviceArea;
    }

    public double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public int getServiceMaxPeople() {
        return serviceMaxPeople;
    }

    public void setServiceMaxPeople(int serviceMaxPeople) {
        this.serviceMaxPeople = serviceMaxPeople;
    }

    public String getServiceStandardRoom() {
        return serviceStandardRoom;
    }

    public void setServiceStandardRoom(String serviceStandardRoom) {
        this.serviceStandardRoom = serviceStandardRoom;
    }

    public String getServiceDescriptionOtherConvenience() {
        return serviceDescriptionOtherConvenience;
    }

    public void setServiceDescriptionOtherConvenience(String serviceDescriptionOtherConvenience) {
        this.serviceDescriptionOtherConvenience = serviceDescriptionOtherConvenience;
    }

    public double getServicePollArea() {
        return servicePollArea;
    }

    public void setServicePollArea(double servicePollArea) {
        this.servicePollArea = servicePollArea;
    }

    public int getServiceNumberOfFloors() {
        return serviceNumberOfFloors;
    }

    public void setServiceNumberOfFloors(int serviceNumberOfFloors) {
        this.serviceNumberOfFloors = serviceNumberOfFloors;
    }

    public int getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public int getServiceRentTypeId() {
        return serviceRentTypeId;
    }

    public void setServiceRentTypeId(int serviceRentTypeId) {
        this.serviceRentTypeId = serviceRentTypeId;
    }
}
