package com.maphib;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
public class NearbyDAO {

public static Near namesJson(String place) throws JSONException, IOException {
	/*Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();  
Transaction t=session.beginTransaction();  */
	StringBuilder stringBuilder = new StringBuilder("https://maps.googleapis.com/maps/api/geocode/json?");
	stringBuilder.append("address="+place);
	stringBuilder.append("&sensor=false");
	stringBuilder.append("&key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A");
	
	Near near = new Near();
	String url = stringBuilder.toString();
	System.out.println(url);
	JSONObject json = readJsonFromUrl(url);
    /*System.out.println(json.toString());*/
    JSONArray jArray = (JSONArray) json.get("results");
    
   double lat = 0.0, lng = 0.0;
    for (int i=0; i<jArray.length();i++){
    JSONObject jobj1 = (JSONObject) jArray.get(i);
    JSONObject geometry = (JSONObject) jobj1.get("geometry");
    JSONObject location = (JSONObject) geometry.get("location");
    lat = (Double) location.get("lat");
    lng = (Double) location.get("lng");
    
    }
   /* latLng.forEach(System.out::println);*/
    
    near.setLat(lat);
    near.setLng(lng);
   
 	/*poi.setName(latLng);*/
 	
 	/*session.persist(poi);
    t.commit();  
    session.close();  */
    System.out.println("success"); 
    /*return poi;*/
	return near;
    
    
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

/*public static void main(String... s) throws JSONException, IOException {
	namesJson("pune");
	
}*/

/*public static int save(Poi name) throws JSONException, IOException {
	
	JSONObject json = readJsonFromUrl("https://maps.googleapis.com/maps/api/place/textsearch/json?query=delhi+point+of+interest&language=en&key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A");
    System.out.println(json.toString());
    JSONArray jArray = (JSONArray) json.get("results");
    List<String> names = new ArrayList<String>();
    for (int i=0; i<jArray.length();i++){
    JSONObject jobj = (JSONObject) jArray.get(i);
    names.add(jobj.getString("name")); 
    System.out.println(name);
    }
    for (int i = 0; i < names.size(); i++){
 	System.out.println(names.get(i));
    }
	int status = 0;
	try{  
        Connection con=HistoryDAO.getConnection();  
        PreparedStatement ps=con.prepareStatement(  
                     "insert into poinames(names) VALUES (?)");  
        ps.setString(1,name.getName());  
        
        status=ps.executeUpdate();  
          
        con.close();  
    }catch(Exception ex){ex.printStackTrace();}  
      
    return status;  
}  */
}