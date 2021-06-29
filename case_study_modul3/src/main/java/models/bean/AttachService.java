package models.bean;

public class AttachService {
    private int attachServiceId ;
    private String attachServiceName ;
    private double attachServiceCost ;
    private int attachServiceUntil ;
    private String attachServiceStatus ;

    public AttachService(int attachServiceId, String attachServiceName, double attachServiceCost,
                         int attachServiceUntil, String attachServiceStatus) {
        this.attachServiceId = attachServiceId;
        this.attachServiceName = attachServiceName;
        this.attachServiceCost = attachServiceCost;
        this.attachServiceUntil = attachServiceUntil;
        this.attachServiceStatus = attachServiceStatus;
    }

    public int getAttachServiceId() {
        return attachServiceId;
    }

    public void setAttachServiceId(int attachServiceId) {
        this.attachServiceId = attachServiceId;
    }

    public String getAttachServiceName() {
        return attachServiceName;
    }

    public void setAttachServiceName(String attachServiceName) {
        this.attachServiceName = attachServiceName;
    }

    public double getAttachServiceCost() {
        return attachServiceCost;
    }

    public void setAttachServiceCost(double attachServiceCost) {
        this.attachServiceCost = attachServiceCost;
    }

    public int getAttachServiceUntil() {
        return attachServiceUntil;
    }

    public void setAttachServiceUntil(int attachServiceUntil) {
        this.attachServiceUntil = attachServiceUntil;
    }

    public String getAttachServiceStatus() {
        return attachServiceStatus;
    }

    public void setAttachServiceStatus(String attachServiceStatus) {
        this.attachServiceStatus = attachServiceStatus;
    }
}
