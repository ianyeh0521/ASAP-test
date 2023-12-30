package com.asap.member.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.List;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.oauth2.Oauth2;
import com.google.api.services.oauth2.model.Userinfo;

public class GoogleCodeFlow {
	private static List<String> scopes = Arrays.asList("https://www.googleapis.com/auth/userinfo.profile",
			"https://www.googleapis.com/auth/userinfo.email");
//	private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
//	GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY,
//			new InputStreamReader(getServletContext().getResourceAsStream(CLIENT_SECRET_FILE), "UTF-8"));

	private static final String oauthClientId = "854983059537-iuclihemktudsc7dgdl6lcuprc5gai9q.apps.googleusercontent.com";
	private static final String oauthClientSecret = "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";

//	private static GoogleAuthorizationCodeFlow flow = 

	public static GoogleAuthorizationCodeFlow newFlow() {
		try {
			return new GoogleAuthorizationCodeFlow.Builder(GoogleNetHttpTransport.newTrustedTransport(),
//				new NetHttpTransport(),

					JacksonFactory.getDefaultInstance(),
					// Your OAuth client ID
					oauthClientId,
					// Your OAuth client secret
					oauthClientSecret,
					// Tells the user what permissions they're giving you
					scopes).setAccessType("offline").build();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

//	public static boolean isUserLoggedIn(String sessionId) {
//		try {
//			Credential credential = newFlow().loadCredential(sessionId);
//			return credential != null;
//		} catch (IOException e) {
//			// Error getting login status
//			return false;
//		}
//	}

//	public static Userinfo getUserInfo(String sessionId) throws IOException {
//		String appName = "ASAP";
//		Credential credential = newFlow().loadCredential(sessionId);
//		Oauth2 oauth2Client = new Oauth2.Builder(new NetHttpTransport(), JacksonFactory.getDefaultInstance(),
//				credential).setApplicationName(appName).build();
//
//		Userinfo userInfo = oauth2Client.userinfo().get().execute();
//		return userInfo;
//	}
}
