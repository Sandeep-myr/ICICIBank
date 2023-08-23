package bank;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;




@SuppressWarnings("serial")
@MultipartConfig
public class UserDetailsUpdate extends HttpServlet {
	PreparedStatement pstmt;
	String message="";
	RequestDispatcher rd;
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();

     
     String accountnumber = (String) session.getAttribute("accountnumber");
       
        String operation = request.getParameter("operation");
        
        
         ServletContext sc = request.getServletContext();
         
         Connection conn = (Connection) sc.getAttribute("oracle");
         
        try {          

    if ("password".equals(operation)) {
     String newPassword = request.getParameter("new-password");
                pstmt = conn.prepareCall("update customerlogindetails set password=? where accountnumber=?");
                pstmt.setString(2, accountnumber);
                pstmt.setString(1, newPassword);
                pstmt.executeUpdate();
                conn.commit();
                pstmt.close();
                message= "Password Updated Successfully";
                
                request.getSession().setAttribute("message", message);

               
                request.getRequestDispatcher("Popup.jsp").include(request, response);
                request.getRequestDispatcher("/BankHome.html").include(request, response);
           
    } else if ("profilepic".equals(operation)) {
            	Part image = request.getPart("new-profile-pic");
        		InputStream photo = image.getInputStream();

                pstmt = conn.prepareCall("update customerdetails set  PROFILEPIC=? where accountnumber=?");
                pstmt.setString(2, accountnumber);
                pstmt.setBlob(1, photo);
                pstmt.executeUpdate();
                message= "Image Updated Successfully";
                
                request.getSession().setAttribute("message", message);

               
                request.getRequestDispatcher("Popup.jsp").include(request, response);
                request.getRequestDispatcher("ProfileUpdate.jsp").include(request, response);
            } else if ("mobile".equals(operation)) {
            	Long newMobileNumber = Long.parseLong(request.getParameter("new-mobile-number"));
                
  System.out.println(newMobileNumber);
                pstmt = conn.prepareCall("update customercontactdetails set mobilenumber=? where accountnumber=?");
                pstmt.setString(2, accountnumber);
                pstmt.setLong(1, newMobileNumber);
                pstmt.executeUpdate();
                conn.commit();
                message= "Mobile Number is  Updated Successfully";
                
                request.getSession().setAttribute("message", message);
               request.getRequestDispatcher("Popup.jsp").include(request, response);
                request.getRequestDispatcher("ProfileUpdate.jsp").include(request, response);
            } else if ("email".equals(operation)) {
             
            	String newEmailid = request.getParameter("new-email-id");
                pstmt = conn.prepareCall("update customercontactdetails set emailid=? where accountnumber=?");
               System.out.println(accountnumber);
                pstmt.setString(2, accountnumber);
                pstmt.setString(1, newEmailid);
              
               pstmt.executeUpdate();
                conn.commit();
                pstmt.close();
                
                message= "Email Updated Successfully";
                
                request.getSession().setAttribute("message", message);

               
                request.getRequestDispatcher("Popup.jsp").include(request, response);
                request.getRequestDispatcher("ProfileUpdate.jsp").include(request, response);
            }

            

           
        } catch (Exception e) {
            pw.println("An error occurred: " + e.getMessage());
        }
        
    }
}
