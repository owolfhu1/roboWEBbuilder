

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/server")
public class server extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBresumeBuilder DB = new DBresumeBuilder();
	
    public server() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nextURL = "";
		Resume resume;
		String options;
		int index;
		String id;
		//boolean hasResume = session.
		
		//get action
		String act = request.getParameter("act");
		
		switch(act) {
			case "login":
				
				//todo, test it after adding save option
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				id = DB.login(email, password);
				if (!id.equals("-1")) {
					resume = DB.getResume(id);
					nextURL = "/viewer.jsp";
					session.setAttribute("body", build(resume));
				} else nextURL = "/index.html";
				
			break;
			case "save":
				resume = (Resume)session.getAttribute("resume");
				id = DB.login(resume.getEmail(), resume.getPass());
				if (!id.equals("-1")) {
					DB.deleteResume(id);
				}
				DB.addResume(resume);
				nextURL = "/index.html";
			break;
			case "new":
				resume = new Resume(request.getParameter("email"),request.getParameter("password"),request.getParameter("name"));
				session.setAttribute("resume", resume);
				session.setAttribute("body", "new resume...");
				nextURL = "/viewer.jsp";
			break;
			case "addEdu":
				resume = (Resume)session.getAttribute("resume");
				String school = request.getParameter("school");
				String degree = request.getParameter("degree");
				resume.addEdu(new Edu(school, degree));
				session.setAttribute("body", build(resume));
				nextURL = "/viewer.jsp";
			break;
			case "addWork":
				resume = (Resume)session.getAttribute("resume");
				String title = request.getParameter("title");
				String company = request.getParameter("company");
				String taskString = request.getParameter("tasks");
				ArrayList<String> tasks = new ArrayList<>(Arrays.asList(taskString.split(",")));
				resume.addWork(new Work(company, title, tasks));
				session.setAttribute("body", build(resume));
				nextURL = "/viewer.jsp";
			break;
			case "addSkill":
				resume = (Resume)session.getAttribute("resume");
				String skill = request.getParameter("skill");
				String level = request.getParameter("level");
				resume.addSkill(new Skill(skill, level));
				session.setAttribute("body", build(resume));
				nextURL = "/viewer.jsp";
			break;
			case "xEdu":
				resume = (Resume)session.getAttribute("resume");
				ArrayList<Edu> edu = resume.getEdu();
				options = "";
				if(!edu.isEmpty()) {
					for (int i = 0; i < edu.size(); i++) {
						options += "<input type=\"radio\" name=\"option\" value=\"" + i + "\"/>"+ edu.get(i).getSchool() + "<br>";
					}
					session.setAttribute("options", options);
					session.setAttribute("act", "delEdu");
					nextURL = "/x.jsp";
				} else {
					String body = build(resume) + "<p>you must add education before you can delete it!!!</p>";
					session.setAttribute("body", body);
					nextURL = "/viewer.jsp";
				}
			break;
			case "xWork":
				resume = (Resume)session.getAttribute("resume");
				ArrayList<Work> work = resume.getWork();
				options = "";
				if(!work.isEmpty()) {
					for (int i = 0; i < work.size(); i++) {
						options += "<input type=\"radio\" name=\"option\" value=\"" + i + "\"/>"+ work.get(i).getTitle() + ": " + work.get(1).getCompany() + "<br>";
					}
					session.setAttribute("options", options);
					session.setAttribute("act", "delWork");
					nextURL = "/x.jsp";
				} else {
					String body = build(resume) + "<p>you must add work before you can delete it!!!</p>";
					session.setAttribute("body", body);
					nextURL = "/viewer.jsp";
				}
			break;
			case "xSkill":
				resume = (Resume)session.getAttribute("resume");
				ArrayList<Skill> skills = resume.getskills();
				options = "";
				if(!skills.isEmpty()) {
					for (int i = 0; i < skills.size(); i++) {
						options += "<input type=\"radio\" name=\"option\" value=\"" + i + "\"/>"+ skills.get(i).getSkill() + "<br>";
					}
					session.setAttribute("options", options);
					session.setAttribute("act", "delSkill");
					nextURL = "/x.jsp";
				} else {
					String body = build(resume) + "<p>you must add skill before you can delete it!!!</p>";
					session.setAttribute("body", body);
					nextURL = "/viewer.jsp";
				}
			break;
			case "delEdu":
				resume = (Resume)session.getAttribute("resume");
				index = Integer.parseInt((String)request.getParameter("option"));
				resume.removeEdu(index);
				session.setAttribute("resume", resume);
				session.setAttribute("body", build(resume));
				nextURL = "/viewer.jsp";
			break;
			case "delWork":
				resume = (Resume)session.getAttribute("resume");
				index = Integer.parseInt((String)request.getParameter("option"));
				resume.removeWork(index);
				session.setAttribute("resume", resume);
				session.setAttribute("body", build(resume));
				nextURL = "/viewer.jsp";
			break;
			case "delSkill":
				resume = (Resume)session.getAttribute("resume");
				index = Integer.parseInt((String)request.getParameter("option"));
				resume.removeSkill(index);
				session.setAttribute("resume", resume);
				session.setAttribute("body", build(resume));
				nextURL = "/viewer.jsp";
			break;
			
		}
	
		//go to nextURL
		getServletContext().getRequestDispatcher(nextURL).forward(request,response);
	}
	
	//builds resume and returns as string formated for html
	private String build(Resume r) {
		String x = "";
		ArrayList<Edu> eduList = r.getEdu();
        ArrayList<Work> workList = r.getWork();
        ArrayList<Skill> skillList = r.getskills();
        
         
        if(!eduList.isEmpty()) x += "<h2>Education: </h2>";
        for (Edu edu : eduList) {
        	x += edu.getSchool() + "<br>";
        	x += edu.getDegree() + "<br><br>";
        }
        if(!workList.isEmpty()) x += "<h2>Work Experence: </h2>";
        for (Work work : workList) {
        	x += work.getTitle() + "<br>";
        	x += work.getCompany() + "<br>";
        	for(String task : work.getTasks()){
        		x += task + "<br>";
        	}
        	x += "<br>";
        }
        if(!skillList.isEmpty()) x += "<h2>Skills: </h2>";
        for (Skill skill : skillList) {
        	x += String.format("%s: %s <br>", skill.getSkill(), skill.getLevel());
        }
		return x;
	}
}

/*
 * TODO:
 *   -make database tables
 *   -add in login
 *   -add save button to viewer.jsp
 *   -
 */
