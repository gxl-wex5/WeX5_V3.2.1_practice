import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.common.SystemUtils;
import com.justep.ui.JProcessor;
import com.justep.ui.util.NetUtils;


public class IndexUrl implements JProcessor  {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getParameter("url");
		String result = "";
		if (SystemUtils.isNotEmptyString(url)){
			String vls = NetUtils.generateVLS(req, url);
			result = "./" + vls + SystemUtils.removeUI(url);
			
			String queryString = req.getQueryString();
			if (SystemUtils.isNotEmptyString(queryString)){
				result += "?" + queryString;
			}
		}
		System.out.println(result);
		Writer writer = null;
		try{
			writer = resp.getWriter();
			writer.append(result);
		}catch(Exception e){
			
		}finally{
			if (writer != null)
				try {
					writer.close();
				} catch (IOException e) {
					
				}	
		}
	}
	
}
