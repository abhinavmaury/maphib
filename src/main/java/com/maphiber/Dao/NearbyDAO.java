package com.maphiber.Dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.maphiber.Pojo.Near;

public class NearbyDAO {

	public static Near namesJson(String place) throws JSONException, IOException {

		Near near = new Near();

		StringBuilder stringBuilder = new StringBuilder("https://maps.googleapis.com/maps/api/geocode/json?");
		stringBuilder.append("address=" + URLEncoder.encode(place, "UTF-8"));
		stringBuilder.append("&sensor=false");
		stringBuilder.append("&key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A");

		try {
			String url = stringBuilder.toString();
			System.out.println(url);
			JSONObject json = readJsonFromUrl(url);
			if (json != null) {
				/* System.out.println(json.toString()); */
				JSONArray jArray = (JSONArray) json.get("results");

				double lat = 0.0, lng = 0.0;
				for (int i = 0; i < jArray.length(); i++) {
					JSONObject jobj1 = (JSONObject) jArray.get(i);
					JSONObject geometry = (JSONObject) jobj1.get("geometry");
					JSONObject location = (JSONObject) geometry.get("location");

					lat = (Double) location.get("lat");
					lng = (Double) location.get("lng");
				}
				near.setLat(lat);
				near.setLng(lng);
				return near;
			}else
				System.out.println("JSON was null.");
		} catch (Exception e) {
			System.out.println("Could not execute for that perticular place.");
		}
		return near;
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
			System.out.println("Here comes error in nearby places. The problem occurs while reading JSON from url! ");
			return null;
		} finally {
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
		namesJson("pune");

	}
}