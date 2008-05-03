class PostCodeServiceTests extends GroovyTestCase {

    void testPostcodesLoad() {
        def svc = new PostCodeService()
        svc.afterPropertiesSet()
        
        assertTrue svc.postCodeLocations.size() > 0
        assertNotNull svc.postCodeLocations['GL52']
    }

    void testPostcodeLookup() {
        def svc = new PostCodeService()
        svc.afterPropertiesSet()
        
        def locA = svc.getPostCodeCentre('GL52')
        assertNotNull locA

        def locB = svc.getPostCodeCentre('GL5 2RL')
        assertNotNull locB
        
        assertEquals locA, locB

        def locC = svc.getPostCodeCentre('XKF956')
        assertNull locC
    }
    
    void testPointDistance() {
        def svc = new PostCodeService()
        svc.afterPropertiesSet()
        
        def dist = svc.getDistanceBetweenPostCodes('GL5 2RL', 'GL5 2RL')
        assertEquals 0.0, dist

        def pa = svc.getPostCodeCentre('GL5 2RL')
        def pb = svc.getPostCodeCentre('SP2 7NW')
        println "Point A = ${pa.centre.dump()} "
        println "Point B = ${pb.centre.dump()}"
        dist = svc.getDistanceBetweenPostCodes('GL5 2RL', 'SP2 7NW')
        println "dist between codes is $dist"
        assertTrue ((dist > 78) && (dist < 79))
    }
    
    void testSanitize() {
        def svc = new PostCodeService()
        svc.afterPropertiesSet()

        assertEquals "GL52RL", svc.sanitize("GL5 2RL")
        assertEquals "GL52RL", svc.sanitize("GL5-2RL")
        assertEquals "GL52RL", svc.sanitize("GL5 - 2RL.")
        assertEquals "BS99", svc.sanitize("bs 99")
    }
}
