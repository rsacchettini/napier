class NapierTagLib {
	def imageDisp = { attrs, body ->
		def property = Property.get( attrs.beanid )
		def mode = attrs.mode;
		def pictures = []
		if(property.picture != null && property.pictureType != null)
		{
			for(i in 0..property.picture.length-1)
			{
			  if (property.picture[i] != null && property.pictureType[i] != null)
				pictures << [(String)property.picture[i], mode, property.id]
			}
			  out << render(template:"/property/images",collection:pictures, var:"image")
		}

	  }


}


