package murach.business;

public class Survey {
    private String  Search;
    private String  Announcement;
    private String Offer;
    private String ContactMethod;


    public Survey() {
    }
    public Survey(String Search, String Announcement, String Offer, String ContactMethod) {
        this.Search = Search;
        this.Announcement = Announcement;
        this.Offer = Offer;
        this.ContactMethod = ContactMethod;
    }

    public String getSearch() {
        return Search;
    }
    public void setSearch(String Search) {
        this.Search = Search;
    }

    public String getAnnouncement() {
        return Announcement;
    }

    public void setAnnouncement(String Announcement) {
        this.Announcement = Announcement;
    }

    public String getOffer() {
        return Offer;
    }

    public void setOffer(String Offer) {
        this.Offer = Offer;
    }

    public String getContactMethod() {
        return ContactMethod;
    }

    public void setContactMethod(String ContactMethod) {
        this.ContactMethod = ContactMethod;
    }
}
