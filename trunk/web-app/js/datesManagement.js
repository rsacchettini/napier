var compteur = 0;
var ids;
var idscompteur = 0;
var cal2;
var initialized = 0;

function init()
{
   if (initialized == 0)
    {
         compteur = document.getElementById("visitTimeCount").getAttribute("value");
		if (compteur == "")
		{
			var i = 2;
			compteur = 0;
			while(document.getElementById("availableFrom1_" + i))
			{
				compteur++;
				i++;
			}
			compteur = (document.getElementById("availableFrom1") != null ? (compteur+1) : compteur);
			
		}
		 initialized = 1;
    }

}
    function getParent(element, parentTagName) {
        if ( ! element )
            return null;
        else if ( element.nodeType == 1 && element.tagName.toLowerCase() == parentTagName.toLowerCase() )
            return element;
        else
            return getParent(element.parentNode, parentTagName);
    }
    /* ajoute une ligne */
    function addLigne(link) {
        init();
        compteur ++;
        document.getElementById("visitTimeCount").setAttribute("value", compteur);
		ids = new Array(5);
        ids[idscompteur] = compteur;
        idscompteur++


        // 1. récuperer le node "TABLE" à manipuler
        var td = link.parentNode;
        var table = getParent(td,'TABLE');

        // 2. on va manipuler le TBODY
        var tbody = table.tBodies[0];

        // 3. on clone la ligne de reference
        //var newTr = tbody.rows[0].cloneNode(true);
        var availableid = 'availableFrom' + compteur;
        var newTr = tbody.rows[0].cloneNode(true);
        browseInputChild(newTr);
        tbody.appendChild(newTr);
        initCal();
        idscompteur = 0

    }

    function Remplace(expr,a,b) {
      var i=0
      while (i!=-1) {
         i=expr.indexOf(a,i);
         if (i>=0) {
            expr=expr.substring(0,i)+b+expr.substring(i+a.length);
            i+=b.length;
         }
      }
      return expr
   }

    function browseInputChild(newTr)
    {
        if(newTr)
        {
            if(newTr.nodeType == 1)
            {

                   if(newTr.id)
                   {
                         if ((newTr.className == "calendar yui-skin-sam yui-calcontainer single" && newTr.nodeName == "DIV")||
                              (newTr.nodeName == "INPUT" && newTr.type != "hidden"))
                         {
                           ids[idscompteur] = newTr.id;
                           idscompteur++
                         }

                          if(newTr.id == "availableFrom1_day")
                          {
                              newTr.id = "availableFrom1" + "_" + compteur + "_day";
                              newTr.name = "availableFrom1" + "_" + compteur + "_day";
                          }
                          else if (newTr.id == "availableFrom1_month")
                          {
                              newTr.id = "availableFrom1" + "_" + compteur + "_month";
                              newTr.name = "availableFrom1" + "_" + compteur + "_month";
                          }
                          else if (newTr.id == "availableFrom1_year")
                          {
                              newTr.id = "availableFrom1" + "_" + compteur + "_year";
                              newTr.name = "availableFrom1" + "_" + compteur + "_year";
                          }
                          else if(newTr.id == "availableFrom2_day")
                          {
                              newTr.id = "availableFrom2" + "_" + compteur + "_day";
                              newTr.name = "availableFrom2" + "_" + compteur + "_day";
                          }
                          else if (newTr.id == "availableFrom2_month")
                          {
                              newTr.id = "availableFrom2" + "_" + compteur + "_month";
                              newTr.name = "availableFrom2" + "_" + compteur + "_month";
                          }
                          else if (newTr.id == "availableFrom2_year")
                          {
                              newTr.id = "availableFrom2" + "_" + compteur + "_year";
                              newTr.name = "availableFrom2" + "_" + compteur + "_year";
                          }
                          else
                          {
                            newTr.id = newTr.id + "_" + compteur;
                            newTr.name = newTr.id + "_" + compteur;
                          }
                   }
 
            }


             for (var i = 0; i < newTr.childNodes.length; i++)
            {
                      browseInputChild(newTr.childNodes[i]);
            }
        }
    }

    function initCal()
    {
         cal2 = new Calendar();
         cal2.setDisplayContainer(ids[2] + "_" + compteur);
         cal2.setInputId(ids[1] + "_" + compteur);
         cal2.setStructId("availableFrom1" + "_" + compteur);
         cal2.setFormat("dd.MM.yyyy");
         cal2.setLocale("fr");
         cal2.init();

         cal2 = new Calendar();
         cal2.setDisplayContainer(ids[4] + "_" + compteur);
         cal2.setInputId(ids[3] + "_" + compteur);
         cal2.setStructId("availableFrom2" + "_" + compteur);
         cal2.setFormat("dd.MM.yyyy");
         cal2.setLocale("fr");
         cal2.init();
    }
       

    /* supprimer une ligne */
    function delLigne(link) {
        init();
        compteur--;
        document.getElementById("visitTimeCount").setAttribute("value", compteur);
        // 1. récuperer le node "TABLE" à manipuler
        var td = link.parentNode;
        var table = getParent(td, 'TABLE');

        // 2. récuperer le TBODY
        var tbody = table.tBodies[0];

        // 3. Supprimer le TR
        tbody.removeChild(getParent(td, 'TR'));
    }

