class NapierTagLib {
    static def principal = PrincipalService.getPrincipal()
    def imageDisp = {attrs, body ->
        def property = Property.get(attrs.beanid)
        def mode = attrs.mode;
        def pictures = []
        if (property.picture != null && property.pictureType != null && property.picture.length > 0)
        {
            for (i in 0..property.picture.length - 1)
            {
                if (property.picture[i] != null && property.pictureType[i] != null)
                    pictures << [(String) property.picture[i], mode, property.id.encodeAsURL()]
            }
            out << render(template: "/property/images", collection: pictures, var: "image")
        }

    }

    def imageDisp2 = {attrs, body ->
        def property = Property.get(attrs.beanid)
        def mode = attrs.mode;
        def pictures = []
        def altNumbers = ["One", "Two", "Three", "Four", "Five"]
        if (property.picture != null && property.pictureType != null && property.picture.length > 0)
        {
            for (i in 0..property.picture.length - 1)
            {
                if (property.picture[i] != null && property.pictureType[i] != null)
                    pictures << [(String) property.picture[i], mode, property.id.encodeAsURL(), (String) altNumbers.getAt(i)]
            }
            out << render(template: "/property/images2", collection: pictures, var: "image")
        }

    }

    def autoImageSlideshow = {attrs, body ->
        def property = Property.get(attrs.beanid)
        if (property.picture != null && property.pictureType != null)
        {
            if (property.picture.length > 1)
            {
                out << "<script type=\"text/javascript\"> \n"
                out << "var counter${property.id} = 0;\n"
                out << "var img${property.id};\n"
                out << "if(document.getElementById('img${property.id}'))\n"
                out << "{ \n"
                out << "  img${property.id} = new Array("
                for (i in 0..property.picture.length - 1)
                {
                    out << "'${createLinkTo(dir: '')}/images/properties/${property.picture[i]}'"
                    if (i < property.picture.length - 1)
                        out << ","
                }
                out << "); \n"
                //out << "defil${property.id}();\n"
                out << " setTimeout('defil${property.id}()', (Math.random()*500));\n "
                out << "}\n"
                out << "function anim${property.id}()\n"
                out << "  {\n   "


                out << "      document.getElementById('img${property.id}').src = img${property.id}[counter${property.id}];\n"
                out << "      counter${property.id}++; \n"
                out << "       if (counter${property.id} == ${property.picture.length})\n"
                out << "	      counter${property.id} = 0;\n"
                out << "  }  \n  "

                out << "function defil${property.id}()  \n"
                out << "  {   \n          "
                out << "    temp = 1,5; \n "
                out << "    if (temp != NaN) \n "
                out << "	  duree = temp * 1000;\n   "
                out << "    else       \n "
                out << "	  duree = 4000; \n     "

                out << "	  var timer = setInterval('anim${property.id}()', duree);\n "
                out << "  }    \n  "
                out << "</script>"
            }
            else if (property.picture.length == 1)
            {
                out << "<script type=\"text/javascript\"> \n"
                out << "document.getElementById('img${property.id}').src = ${createLinkTo(dir: '')}/images/properties/${property.picture[0]};\n"
                out << "</script>"
            }
            else if (property.picture.length == 0)
            {
                out << "<script type=\"text/javascript\"> \n"
                out << "document.getElementById('img${property.id}').alt = 'no picture available';\n"
                out << "</script>"
            }
        }

    }

    def datesEdit = {attrs, body ->
        def property = Property.get(attrs.beanid)

        out << render(template: "/property/datesEdit", bean: property)
    }

    def datesDisp = {attrs, body ->
        def property = Property.get(attrs.beanid)

        out << render(template: "/property/datesDisp", bean: property)
    }

    def sellerPropertiesNum =
    {
        def principal = PrincipalService.getPrincipal()
        if (principal != null)
        {
            def seller = Seller.findByUsername(principal.getUsername())
            if (seller != null)
            {
                def sellProperties = seller.sellProperties
                if (sellProperties != null)
                    out << "(${sellProperties.size()})"
            }
        }
    }

    def buyerInterestListNum =
    {
        def principal = PrincipalService.getPrincipal()
        if (principal != null && principal!="anonymousUser")
        {

            def buyer = (Buyer) Buyer.findByUsername(principal.getUsername())
            if (buyer != null)
            {
                def buyerInterestList = Interested.findAll("from Interested as i where i.myBuyer.id=?", buyer.id)

                def plist = []

                buyerInterestList.each {ob -> plist.add(ob.myProp)}
                if (buyerInterestList != null)
                {// if the logged user is a seller then retrieve his properties.
                    out << "(${plist.size()})"
                }
            }

        }
    }

    def buyerAppointementsNum =
    {

        def principal = PrincipalService.getPrincipal()
        if (principal != null && principal!="anonymousUser")
        {
            def buyer = Buyer.findByUsername(principal.getUsername())
            if (buyer != null)
            {
                def appointments = buyer.appointments
                if (appointments != null)
                    out << "(${appointments.size()})"
            }
        }
    }

    def ifSellerProperty =
    {attrs, body ->
        def property = Property.get(params.id)
        def principal = PrincipalService.getPrincipal()
        if (principal != null && principal!="anonymousUser")
        {
            def seller = Seller.findByUsername(principal.getUsername())
            if (seller != null)
            {
                def sellProperties = seller.sellProperties
                if (sellProperties != null && sellProperties.findIndexOf {property} != -1)
                {
                    out << body()
                }

            }
        }
    }

    def ifPropertyInBuyerInterest =
    {attrs, body ->
        def test = attrs.id
        def property = Property.get(attrs.id)
        def principal = PrincipalService.getPrincipal()
        if (principal != null && principal!="anonymousUser")
        {
            def buyer = Buyer.findByUsername(principal.getUsername())
            if (buyer != null)
            {
                def interestList = Interested.findAll("from Interested as i where i.myBuyer.id=?", buyer.id)
                if (interestList != null && interestList.findIndexOf {property} != -1)
                {
                    out << body()
                }

            }
        }
    }
}
