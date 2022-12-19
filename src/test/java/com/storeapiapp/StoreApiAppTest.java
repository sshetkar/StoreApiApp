package com.storeapiapp;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

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
        return Karate.run().tags("@debug").relativeTo(getClass());
    }

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:com.storeapiapp")
                .outputCucumberJson(true)
                .parallel(1);
                generateReport(results.getReportDir());
        //assertTrue(results.getFailCount() == 0,results.getErrorMessages());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "storeapiapp");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}