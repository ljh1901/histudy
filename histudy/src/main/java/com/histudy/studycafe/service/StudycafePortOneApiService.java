package com.histudy.studycafe.service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class StudycafePortOneApiService {
	
	private static final String STORE_ID = "store-83eacdb9-6d28-4c80-b53b-26d96da03490";
    private static final String AUTH_KEY = "PortOne pRHF7tzUF0KgA2pG1KQWOo53nVunQCNYHLkfcagOTGtuPrwb8sShS2MbU2REjgqRjysw5KTuVMmpzyS3";
    
    public static JsonNode getPaymentInfo(String paymentId) throws Exception {
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.portone.io/payments/" + paymentId + "?storeId=" + STORE_ID))
                .header("Authorization", AUTH_KEY)
                .header("Content-Type", "application/json")
                .GET()
                .build();

        HttpResponse<String> response = HttpClient.newHttpClient()
                .send(request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() != 200) {
            throw new RuntimeException("PortOne 결제 조회 실패: " + response.body());
        }

        ObjectMapper mapper = new ObjectMapper();
        System.out.println(response.body());
        return mapper.readTree(response.body());
    }
}
