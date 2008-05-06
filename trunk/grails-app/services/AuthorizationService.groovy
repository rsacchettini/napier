class AuthorizationService {

    boolean transactional = true
    
    def static isSellerProperty = {propertyid ->
        if(propertyid != null)
        {
            def property = Property.get(propertyid)
            if(property)
            {
                def principal = PrincipalService.getPrincipal()
                if (principal != null && principal != "anonymousUser")
                {
                    def seller = Seller.findById(principal.domainClass.id)
                    if (seller != null)
                    {
                        def sellProperties = seller.sellProperties
                        return (sellProperties != null && sellProperties.findIndexOf {property} != -1)
                    }
                }
            }
            else
            {
                return true
            }
        }
        else
        {
            return true
        }
    }

    def static isPropertyInBuyerInterest = { propertyid ->
        def property = Property.get(propertyid)
        if(property)
        {
            def principal = PrincipalService.getPrincipal()
            if (principal != null && principal != "anonymousUser")
            {
                def buyer = Buyer.findById(principal.domainClass.id)
                if (buyer != null)
                {
                    def interestList = Interested.findAll("from Interested as i where i.myBuyer.id=?", buyer.id)
                    return (interestList != null && interestList.findIndexOf {property} != -1)
                }
            }
        }
    }
}
