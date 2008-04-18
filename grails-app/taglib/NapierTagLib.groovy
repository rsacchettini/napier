class NapierTagLib {
	def imageDisp = { attrs, body ->
		def property = Property.get( attrs.beanid )
		def mode = attrs.mode;
		def pictures = []
		if(property.picture != null && property.pictureType != null && property.picture.length > 0)
		{
			for(i in 0..property.picture.length-1)
			{
			  if (property.picture[i] != null && property.pictureType[i] != null)
				pictures << [(String)property.picture[i], mode, property.id.encodeAsURL()]
			}
			  out << render(template:"/property/images",collection:pictures, var:"image")
		}

	  }

	def imageDisp2 = { attrs, body ->
		def property = Property.get( attrs.beanid )
		def mode = attrs.mode;
		def pictures = []
		def altNumbers = ["One","Two","Three","Four","Five"]
		if(property.picture != null && property.pictureType != null && property.picture.length > 0)
		{
			for(i in 0..property.picture.length-1)
			{
			  if (property.picture[i] != null && property.pictureType[i] != null)
				pictures << [(String)property.picture[i], mode, property.id.encodeAsURL(), (String)altNumbers.getAt(i)]
			}
			  out << render(template:"/property/images2",collection:pictures, var:"image")
		}

	  }

	def datesEdit = {attrs, body ->
		def property = Property.get( attrs.beanid )

		out << render(template:"/property/datesEdit",bean:property)
	}

	def datesDisp = {attrs, body ->
		def property = Property.get( attrs.beanid )

		out << render(template:"/property/datesDisp",bean:property)
	}

	def sellerPropertiesNum =
	{
		AuthenticateService authenticateService = new AuthenticateService()
  		def principal = authenticateService.principal()
		//def seller =  Seller.findByUsername(principal.getUsername())
		//Seller.findByUsername(principal.getUsername()).sellProperties.collect{it}
		out << "(${Seller.findByUsername(principal.getUsername())?.sellProperties?.size()})"
	}

}
