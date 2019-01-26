package example.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class InfoController {

    @RequestMapping("/info")
    public String info() {
        return String.format(
                "Java version: %s, OS: %s",
                System.getProperty("java.version"),
                System.getProperty("os.name")
        );
    }
}
