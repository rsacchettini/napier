import org.springframework.beans.factory.InitializingBean

class PostCodeService implements InitializingBean {

    static final SECTOR_DATA_RESOURCE = "/uk.pc.ll.csv"
    static final VALID_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    static EARTH_RADIUS = 6371 // km
    
    boolean transactional = false

    def postCodeLocations = [:]
    
    void afterPropertiesSet() {
        loadSectors()
    }
    
    private loadSectors() {
        def reader = new InputStreamReader(getClass().getResourceAsStream(SECTOR_DATA_RESOURCE))
        boolean headerRow = true
        reader.eachLine() {
            def tokens = it.tokenize(',')
            assert tokens.size() == 3, "Postcode data CSV is malformed: $it"
            
            if (headerRow) {
                headerRow = false
                return // skip header
            }
            
            def info = new PostCodeLatLong( postCode: tokens[0],
                centre: new LatLong(lat:Double.parseDouble(tokens[1]), lon:Double.parseDouble(tokens[2])))
            postCodeLocations[tokens[0]] = info  
            
            //println "Loading postcode info: ${info.dump()}"
        }
        println "Loaded ${postCodeLocations.size()} postcode locations"
    }
    
    PostCodeLatLong getPostCodeCentre(postCode) {
        def currentPostCode = sanitize(postCode)
        // Look for full matches and keep working back to shorter codes
        while (currentPostCode.size() > 2) {
            def match = postCodeLocations[currentPostCode]
            if (match) return match
            currentPostCode = currentPostCode[0..-2] // check this works
        }
        return null
    }
    
    // Returns distance in kilometres
    double getDistanceBetweenPoints(LatLong pa, LatLong pb) {
        def dLat = Math.toRadians(pb.lat-pa.lat)
        def dLon = Math.toRadians(pb.lon-pa.lon)
        def a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                Math.cos( Math.toRadians(pa.lat)) * Math.cos( Math.toRadians(pb.lat)) * 
                Math.sin(dLon/2) * Math.sin(dLon/2)
        def c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)) 
        return EARTH_RADIUS * c        
    }

    double getDistanceBetweenPostCodes(String a, String b) {
        def pointA = getPostCodeCentre(a)
        def pointB = getPostCodeCentre(b)
        return getDistanceBetweenPoints(pointA.centre, pointB.centre)
    }
    
    def sanitize(String s) {
        def result = new StringBuffer()
        s.toUpperCase().toList().each() { 
            if (VALID_CHARS.contains(it)) {
                result << it
            }
        }
        return result.toString()
    }
}

class PostCodeLatLong {
    String postCode
    LatLong centre
}

class LatLong {
    double lat
    double lon
}