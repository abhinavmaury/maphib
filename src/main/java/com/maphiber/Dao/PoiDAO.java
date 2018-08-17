package com.maphiber.Dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.maphiber.Pojo.Location;
import com.maphiber.Pojo.Poi;

public class PoiDAO {

	public static Poi namesJson(String lat, String lng, String type) throws JSONException, IOException {

		StringBuilder stringBuilder = new StringBuilder(
				"https://maps.googleapis.com/maps/api/place/textsearch/json?query=bar+near+me&");
		stringBuilder.append("location=" + lat + "," + lng);
		//stringBuilder.append("&rankby=distance");
		stringBuilder.append("&key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A");

		Poi poi = new Poi();
		String url = stringBuilder.toString();
		System.out.println(url);
		try {
			JSONObject json = readJsonFromUrl(url);
			JSONArray jArray = (JSONArray) json.get("results");

			Map<String, Location> places = new HashMap<>();
			for (int i = 0; i < jArray.length(); i++) {
				ArrayList<Location> latLng = new ArrayList<>();
				JSONObject jobj1 = (JSONObject) jArray.getJSONObject(i);

				String reference = jobj1.get("reference").toString();
				// System.out.println(reference);
				String phone_number = "", formatted_address = "", mapUrl = "";
				double rating = 0.0;
				try {

					StringBuilder ref = new StringBuilder(
							"https://maps.googleapis.com/maps/api/place/details/json?reference=");
					ref.append(reference + "&sensor=true&key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A");

					String refUrl = ref.toString();
					System.out.println(refUrl);
					JSONObject refJson = readJsonFromUrl(refUrl);
					if (refJson != null) {
						JSONObject result = refJson.getJSONObject("result");
						// System.out.println(result);
						formatted_address = result.get("formatted_address").toString();
						System.out.println(formatted_address);
						
						

						if (result.opt("international_phone_number") != null)
							phone_number = result.get("international_phone_number").toString().replaceAll(" ", "");
						else
							phone_number = "Not available";

						System.out.println(phone_number);

						mapUrl = result.get("url").toString();
						System.out.println(mapUrl);
					} else
						System.out.println("There is some exception in reading JSON! ");
				} catch (Exception e) {
					System.out.println(e);
				}
				JSONObject jobj2 = (JSONObject) jobj1.getJSONObject("geometry");
				// System.out.println(jobj2);
				JSONObject jobj3 = (JSONObject) jobj2.getJSONObject("location");
				double latitude = jobj3.getDouble("lat");
				double longitude = jobj3.getDouble("lng");
				
				rating = jobj1.getDouble("rating"); 
				System.out.println(rating);
				System.out.println(latitude);
				
				
				
				String imagess = jobj1.get("icon").toString();
				
				
				
				
				
				
				
				Location loc = new Location(latitude, longitude, formatted_address, phone_number, mapUrl, rating, imagess);
				// System.out.println(loc.getLat());
				latLng.add(loc);
				String name = jobj1.getString("name").toUpperCase();
				places.put(name, loc);
			}

			for (Map.Entry<String, Location> entry : places.entrySet()) {
				System.out.println("Place: " + entry.getKey() + ", Latitude: " + entry.getValue().getLat()
						+ ", Longitude: " + entry.getValue().getLng() + "rating: "+entry.getValue().getRating() + ", Phone Number: " + entry.getValue().getPhone_number());
			}

			poi.setName(places);

		} catch (Exception e) {
			System.out.println("Could not read from json! Probably JSON is null.");
		}

		System.out.println("success");
		return poi;

	}

	public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {

		InputStream is = new URL(url).openStream();
		BufferedReader rd = null;
		try {
			rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			JSONObject json = new JSONObject(jsonText);
			return json;
		} catch (Exception e) {
			System.out.println("Here comes error in Point of Interest. The problem occurs while reading json from url! ");
			return null;
		} finally {
			// System.out.println("I'm in finally!..");
			rd.close();
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