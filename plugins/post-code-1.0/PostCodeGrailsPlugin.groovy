
class PostCodeGrailsPlugin {
	def version = 1.0
	
    def author = "Marc Palmer"
    def authorEmail = "marc@anyware.co.uk"
    def title = "Provides a service for getting lat/lon from UK postcodes and calculating distance between two postcode centres"
    def description = '''
    Postcode plugin provides the PostCodeService which you can use to calculate the lat/lon coordinates
    of UK postcodes using the free database embedded within it (from nearby.org.uk). The service also has
    a function for calculating the distance between two postcode centres. Over 10,000 postcode centres are
    supplied, but this is for postcode sectors not street-level information. The distances are calculated using
    the Haversine formula.
    '''
    def documentation = 'http://grails.org/PostCode+Plugin'
    
    def doWithSpring = {
		// TODO Implement runtime spring config (optional)
	}   
	def doWithApplicationContext = { applicationContext ->
		// TODO Implement post initialization spring config (optional)		
	}
	def doWithWebDescriptor = {
		// TODO Implement additions to web.xml (optional)
	}	                                      
	def onChange = { event ->
		// TODO Implement code that is executed when this class plugin class is changed  
		// the event contains: event.application and event.applicationContext objects
	}                                                                                  
	def onApplicationChange = { event ->
		// TODO Implement code that is executed when any class in a GrailsApplication changes
		// the event contain: event.source, event.application and event.applicationContext objects
	}
}
