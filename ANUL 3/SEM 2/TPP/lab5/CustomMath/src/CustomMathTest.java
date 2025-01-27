import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.Arrays;
import java.util.Collection;

import static org.junit.Assert.*;

@RunWith(Parameterized.class)
public class CustomMathTest {

    @Parameterized.Parameters
    public static Collection<Object[]> sumValues(){
        return Arrays.asList(new Object[][]{
                {1, 1, 2},
                {-1, 1, 0},
                {10, 15, 25}});
    }

    int x, y, sumResult;

    public CustomMathTest(int x, int y, int sumResult) {
        this.x = x;
        this.y = y;
        this.sumResult = sumResult;
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

      @Test
    public void testDivisionByZero() {
        System.out.println("testDivisionByZero");
        try {
            int result = CustomMath.division(x, y);
            assertFalse(y == 0);
            System.out.println("Test result: passed");
        } catch (IllegalArgumentException e) {
            System.out.println("Test result: failed. Exception caught: " + e.getMessage());
        }
    }


    @Test
    public void testSum() {
        System.out.println("testSum");
        int expResult = sumResult;
        int result = CustomMath.sum(x, y);
        if (expResult != result) {
            fail("Test result: failed");
        } else {
            System.out.println("Test result: passed");
        }
    }
}
