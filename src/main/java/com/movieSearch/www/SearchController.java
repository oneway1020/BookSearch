package com.movieSearch.www;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.movieSearch.www.common.util.Criteria;
import com.movieSearch.www.common.util.PageMaker;

import org.json.simple.parser.ParseException;


@Controller
public class SearchController {
	
	@RequestMapping(value = "/search/{category}", method = RequestMethod.GET)
	public String searchResult(@PathVariable("category")String category, String searchText, Criteria cri, Model model) {

		
		String clientId = "e9nLCvhiPYMCkrFoaQvv"; //애플리케이션 클라이언트 아이디
        String clientSecret = "oHyKzI5pyV"; //애플리케이션 클라이언트 시크릿
        
        PageMaker pageMaker = new PageMaker();
        
        pageMaker.setCri(cri);

        
        int display = pageMaker.getCri().getPerPageNum();	// 한 페이지에 보여주는 갯수
        
        
        // 페이지의 시작점.
        // 1 페이지에선 1 ~ 20(display 개수), 2페이지에선 21 ~ 40
        int start = (pageMaker.getCri().getPage() >= 2) ? 1 + pageMaker.getCri().getPage() * display - display : 1;
        
        // System.out.println("page 값: " + pageMaker.getCri().getPage());
        // System.out.println("start 값: " + start);
        
        String text = null;
        try {
	            text = URLEncoder.encode(searchText, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }
	
	
	        String apiURL = "https://openapi.naver.com/v1/search/" + category + "?query=" + text + "&start=" + start + "&display=" + display + "&sort=date";    // JSON 결과
	        
	        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과
	
	
	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);
	
	
	        // System.out.println(responseBody);
	        
	        // 받아온JSON 정보를(responseBody) 객체형태로 변경해줘야한다.
	        // JSON 파싱
	        try {
	        	JSONParser parser = new JSONParser();
	        	
	        	// parser을 통해 String값을 JSON 객체로 만들어준다...
	        	JSONObject object = (JSONObject) parser.parse(responseBody);
	        	
	        	// 이후 원하는 값이 있다면 get을 통해 꺼낸다.
	        	String totalResult = object.get("total").toString();
	        	
	        	pageMaker.setTotalCount(Integer.parseInt(totalResult));	// 페이지메이커에 총 개수를 넣는다.
	        	
	        	// System.out.println("total값: " + totalResult);
	        	
	        	// JSON에서 배열을 저장할때 사용
	        	JSONArray memberArray = (JSONArray) object.get("items");
	        	
	        	model.addAttribute("result", memberArray);
	        	model.addAttribute("totalResult", totalResult);
	        	model.addAttribute("category", category);
	        	model.addAttribute("pageMaker", pageMaker);
	        	model.addAttribute("searchText", searchText);
	        	
	        	System.out.println(memberArray);
	        	
	        } catch(ParseException e) {
	        	e.printStackTrace();
	        }
	        
	        
	        // model.addAttribute("result", responseBody);
	        
	        return "search";
	    }
	
	
		@RequestMapping(value = "/search/user/{id}", method = RequestMethod.GET)
		public String test1(@PathVariable("id") String id, Model model) {
			
			model.addAttribute("result", id);
			return "test1";
		}
	
		// 클라이언트 정보와 URL을 가지고 검색결과를 가져와 주는 메서드
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
	
	    // 올바른 URL인지 점검하고 연결해주는 메서드
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
	    
	    
	    // 연결된 URL에서 정보를 가져와 읽고 써주는 메서드
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

	
