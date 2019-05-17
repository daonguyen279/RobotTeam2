package Tests.RobotTeam2;

import java.io.IOException;

import org.robotframework.javalib.annotation.ArgumentNames;
import org.robotframework.javalib.annotation.RobotKeyword;
import org.robotframework.javalib.annotation.RobotKeywords;


/**
 * This is an example for a Keyword Library for the Robot Framework.
 * @author thomas.jaspers
 */
@RobotKeywords
public class Demo {
 
    /** This means the same instance of this class is used throughout
     *  the lifecycle of a Robot Framework test execution.
     */
    public static final String ROBOT_LIBRARY_SCOPE = "GLOBAL";    
 
    public static void main( String[] args ) throws IOException
    {
        System.out.println( "Hello World!" );
    }

    @RobotKeyword("Split Text Example")
    @ArgumentNames({"message"})
    public void splitText(String inputText) {
    	System.out.println("Text " + inputText);
    }
 
}
