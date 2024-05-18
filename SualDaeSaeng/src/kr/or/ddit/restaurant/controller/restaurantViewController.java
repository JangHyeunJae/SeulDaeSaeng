package kr.or.ddit.restaurant.controller;

import java.io.*;

import javax.lang.model.util.Elements;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.w3c.dom.NodeList;

import kr.or.ddit.restaurant.service.IRestaurantService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantVO;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/restaurant/view.do")
public class restaurantViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IRestaurantService service = RestaurantServiceImpl.getInstance();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String clientId = "1ztHLrOOajdmUf0Qbfma"; //애플리케이션 클라이언트 아이디
        String clientSecret = "mhSye7LFfH"; //애플리케이션 클라이언트 시크릿


        String text = null;
        try {
            text = URLEncoder.encode("오류동 마장동김씨", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }
        



        
        String blogURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text+"&display=12"; // XML 결과(Blog)
        String imgURL = "https://openapi.naver.com/v1/search/image.xml?query="+ text+"&display=12"; // XML 결과(Blog)

        
        
 
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        
        String responseBlog = get(blogURL,requestHeaders);
        String responseImg = get(imgURL,requestHeaders);



		request.setAttribute("responseBlog", responseBlog);
		
		
		try {			
        	Document doc = Jsoup.connect("https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&query="+text).get();
        	org.jsoup.select.Elements menuName = doc.getElementsByAttributeValue("class", "VQvNX");
        	org.jsoup.select.Elements menuPrice = doc.getElementsByAttributeValue("class", "gl2cc");
        	org.jsoup.select.Elements addr = doc.getElementsByAttributeValue("class", "LDgIH");
        	org.jsoup.select.Elements naverMap = doc.getElementsByAttributeValue("class", "S8peq");
        	org.jsoup.select.Elements nowSales = doc.getElementsByAttributeValue("class", "A_cdD");
        	org.jsoup.select.Elements phoneNum = doc.getElementsByAttributeValue("class", "xlx7Q");
        	org.jsoup.select.Elements addInfo = doc.getElementsByAttributeValue("class", "xPvPE");
        	
        	
        	String menuName1 = menuName.get(0)!=null ? menuName.get(0).text() : "";
        	String menuName2 = menuName.get(1)!=null ? menuName.get(1).text() : "";
        	String menuName3 = menuName.get(2)!=null ? menuName.get(2).text() : "";
        	String menuName4 = menuName.get(3)!=null ? menuName.get(3).text() : "";
        	
        	String menuPrice1 = menuPrice.get(0)!=null ? menuPrice.get(0).select("em").text() : "";
        	String menuPrice2 = menuPrice.get(1)!=null ? menuPrice.get(1).select("em").text() : "";
        	String menuPrice3 = menuPrice.get(2)!=null ? menuPrice.get(2).select("em").text() : "";
        	String menuPrice4 = menuPrice.get(3)!=null ? menuPrice.get(3).select("em").text() : "";
        	
        	String restAddr = addr.get(0)!=null ? addr.get(0).text() : "";
        	String restNaverMap = naverMap.get(0)!=null ? naverMap.get(0).select("a").attr("href"): "";
        	String restNowSales = nowSales.get(0)!=null ? nowSales.get(0).select("em").text() : "";
        	String restSalesTime = nowSales.get(0)!=null ? nowSales.get(0).select("time").text() : "";
        	String restPhoneNum = phoneNum.get(0)!=null ? phoneNum.get(0).text() : "";
        	String restAddInfo = addInfo.get(0)!=null ? addInfo.get(0).text() : "";
        	        
    		request.setAttribute("menuName1", menuName1);
    		request.setAttribute("menuName2", menuName2);
    		request.setAttribute("menuName3", menuName3);
    		request.setAttribute("menuName4", menuName4);
    		
    		request.setAttribute("menuPrice1", menuPrice1);
    		request.setAttribute("menuPrice2", menuPrice2);
    		request.setAttribute("menuPrice3", menuPrice3);
    		request.setAttribute("menuPrice4", menuPrice4);
    		
    		request.setAttribute("restAddr", restAddr);
    		request.setAttribute("restNaverMap", restNaverMap);
    		request.setAttribute("restNowSales", restNowSales);
    		request.setAttribute("restSalesTime", restSalesTime);
    		request.setAttribute("restPhoneNum", restPhoneNum);
    		request.setAttribute("restAddInfo", restAddInfo);        	
       	
		} catch (IOException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("/views/restaurant/restaurantView.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }
            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
        }
    }

}
