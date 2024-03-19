package Feature;

import com.intuit.karate.junit5.Karate;

public class TheftDetectionAPIRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run().relativeTo(getClass());
    }
}
