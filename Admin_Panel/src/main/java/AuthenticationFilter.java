import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthenticationFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String requestURI = httpRequest.getRequestURI();
        
        if (requestURI.contains("addNewProducts.jsp") || requestURI.contains("userManagement.jsp")
                || requestURI.contains("productManagement.jsp") || requestURI.contains("log-out")) {
            
            
            if (httpRequest.getSession().getAttribute("auth") == null) {
               
                httpResponse.sendRedirect("adminLogin.jsp");
                return;
            }
        }
        
       
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
       
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }
}

	
 

