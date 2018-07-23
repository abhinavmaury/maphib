package com.mapshib;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
public class PoiDAO {

public static Poi namesJson(String lat, String lng, String type) throws JSONException, IOException {
	/*Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();  
Transaction t=session.beginTransaction();  */
	StringBuilder stringBuilder = new StringBuilder("https://maps.googleapis.com/maps/api/place/nearbysearch/json?");
	stringBuilder.append("location="+lat+","+lng);
	stringBuilder.append("&radius=111500");
	stringBuilder.append("&type="+type);
	stringBuilder.append("&key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A");
	
	Poi poi = new Poi();
	String url = stringBuilder.toString();
	System.out.println(url);
	JSONObject json = readJsonFromUrl(url);
    /*System.out.println(json.toString());*/
    JSONArray jArray = (JSONArray) json.get("results");
    List<String> names = new ArrayList<String>();
    for (int i=0; i<jArray.length();i++){
    JSONObject jobj1 = (JSONObject) jArray.get(i);
    names.add(jobj1.getString("name")); 
    
    }
    names.forEach(System.out::println);
    
    
   
 	poi.setName(names);
 	
 	/*session.persist(poi);
    t.commit();  
    session.close();  */
    System.out.println("success"); 
    return poi;
    
    
}

public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
  InputStream is = new URL(url).openStream();
  try {
    BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
    String jsonText = readAll(rd);
    JSONObject json = new JSONObject(jsonText);
    return json;
  } finally {
    is.close();
}
}
private static String readAll(Reader rd) throws IOException {
	  
	  
	  
    StringBuilder sb = new StringBuilder();
    int cp;
    while ((cp = rd.read()) != -1) {
      sb.append((char) cp);
    }
    return sb.toString();
  }

public static void main(String... s) throws JSONException, IOException {
	namesJson("28.6279490", "77.3218200", "shopping_mall");
	
}
}
