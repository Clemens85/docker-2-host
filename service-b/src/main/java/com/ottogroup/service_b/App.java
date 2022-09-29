package com.ottogroup.service_b;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@RestController
public class App {

  private RestTemplate restTemplate = new RestTemplate();

  private String serviceAHost;

  public App(@Value("${service_a.host}") String serviceAHost) {
    this.serviceAHost = serviceAHost;
  }

  @GetMapping
  public String sayHello() {
    return "Hello from Service B";
  }

  @GetMapping("/call-service-a")
  public String callServiceA() {
    String url = serviceAHost + "/serviceA";
    System.out.println("Calling " + url);
    return restTemplate.getForObject(url, String.class) + " - called from Service B";
  }

  public static void main(String[] args) {
    SpringApplication.run(App.class, args);
  }

}
