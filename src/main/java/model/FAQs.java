package model;

public class FAQs {
	//declaring variables
    private int faqsid;
    private int id; 
    private String question;
    private String answer;

    // Constructor 
    public FAQs(int faqsid,int id, String question, String answer) {
        this.faqsid = faqsid;
        this.id = id;
        this.question = question;
        this.answer = answer;
    }
//getters & setters
	public int getFaqsid() {
		return faqsid;
	}

	public void setFaqsid(int faqsid) {
		this.faqsid = faqsid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
