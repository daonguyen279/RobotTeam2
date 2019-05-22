package Tests.RobotTeam2;
import org.junit.Test;
import org.openqa.selenium.WebDriver;

import io.percy.selenium.Percy;

public class demo {
	private WebDriver driver;
	Percy percy = new Percy(driver);
	
	@Test
	public void loadsHomePage() {
	    driver.get("http://example.com");

	    // Take a Percy snapshot.
	    percy.snapshot("Home Page");
	}
}
