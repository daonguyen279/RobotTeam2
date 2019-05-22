package Tests.RobotTeam2;

//import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.sun.net.httpserver.HttpServer;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import io.percy.selenium.Percy;;


 public class AppTest {
    private static final String TEST_URL = "http://192.168.189.72/joomla/administrator";
    private static ExecutorService serverExecutor;
    private static HttpServer server;
    private static WebDriver driver;
    private static Percy percy;

    @BeforeEach
    public void startAppAndOpenBrowser() throws IOException {
 
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");
        driver = new ChromeDriver(options);
        percy = new Percy(driver);
    }

    @AfterEach
    public void closeBrowser() {
        // Close our test browser.
        driver.quit();
        // Shutdown our server and make sure the threadpool also terminates.
        server.stop(1);
        serverExecutor.shutdownNow();
    }

    @Test
    public void loadsHomePage() {
        driver.get(TEST_URL);
        WebElement element = driver.findElement(By.className("todoapp"));
        assertNotNull(element);

        // Take a Percy snapshot.
        percy.snapshot("Home Page");
    }

    

    
}
