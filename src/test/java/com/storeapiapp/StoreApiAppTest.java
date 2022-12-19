package com.storeapiapp;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class StoreApiAppTest {

    //Parallel Test - Improved Cucumber report
    // @Test
    // void testParallel() {
    //     Results results = Runner.path("classpath:com.storeapiapp").tags("~@skipme").parallel(5);
    //     assertEquals(0, results.getFailCount(), results.getErrorMessages());
    // }

    //This will run all feature files under com.storeapiapp
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    //specify tag against tags:in double quotes e.g. "debug", "user"
    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("user").relativeTo(getClass());
    }

    // @Test
    // void testParallel() {
    //     Results results = Runner.path("classpath:com.storeapiapp")
    //             //.outputCucumberJson(true)
    //             .parallel(10);
    //     assertEquals(0, results.getFailCount(), results.getErrorMessages());
    // }

}