package api.search;

import com.intuit.karate.junit5.Karate;

class SearchRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("search").relativeTo(getClass());
    }    

}
