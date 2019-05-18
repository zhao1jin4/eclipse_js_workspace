package org.zh.servlet.bootstrap;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.json.JsonStructure;

@WebServlet("/suggestJsonServlet")
public class SuggestJsonServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		JsonBuilderFactory bf = Json.createBuilderFactory(null);

		JsonArrayBuilder arrayBuilder = bf.createArrayBuilder();

		for (int i = 0; i < 5; i++) {
			JsonStructure itemBuilder = bf.createObjectBuilder().add("stuid", 101 + i + ""). // stuid
					add("name", "lisi" + i). // name
					add("score", 70 + i) // score
					// .add("birthday", "2017-01-02")
					.build();

			arrayBuilder.add(itemBuilder);
		}

		JsonStructure root = bf.createObjectBuilder().

				add("code", 200).add("message", "").add("redirect", "").add("value", arrayBuilder.build()).build();

		System.out.println(root.toString());
		resp.setContentType("text/json");
		resp.getWriter().write(root.toString());

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
