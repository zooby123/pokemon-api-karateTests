package runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate runTests() {
        return Karate.run("classpath:test").tags("@test");
    }
}