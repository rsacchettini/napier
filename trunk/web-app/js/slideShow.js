// JavaScript Document

<!--

// mettre un minimum de 4 images !!!

var coef = 0.05 ; // avancement de l'opacité
var temps = 50 ; // temps entre chaque changement d'opacité
var temps_pause = 2000 ; // temps d'attente entre 2 changements d'images
var nombre_image = 11 ; // nombre d'images a faire bouger
var prefix_image = '../images/promo'; // chemin + prefix du nom des images
var suffix_image = '.jpg' ; // suffix + '.extension' du nom des images

// pas touche
var indice = 2; // les 2 premiere image sont deja charger dans le HTML, on commence a la 3eme
var isIE = navigator.userAgent.toLowerCase().indexOf('msie')!=-1 ;
var img1 = null;
var img2 = null ;
var sens = 1;
var tabImg;  // tab contenant les images

function prechargerImg(){
  tabImg = new Array(nombre_image);
  for (i=0; i<=nombre_image -1; i++){
	tabImg[i]=new Image();
	tabImg[i].src = prefix_image+(i+1)+suffix_image;
  }
}

function init()
{
	img1 = document.getElementById("defilement1") ;
	img2 = document.getElementById("defilement2") ;

	prechargerImg();
	change_opacity();
}

function change_opacity()
{	
	var opacity1 = 0 ;
	var opacity2 = 0 ;
	if (isIE)  // for IE
	{	opacity1 = parseFloat(img1.filters.alpha.opacity);
		opacity2 = parseFloat(img2.filters.alpha.opacity);
	}
	else       // for mozilla
	{	opacity1 = parseFloat(img1.style.MozOpacity);
		opacity2 = parseFloat(img2.style.MozOpacity);
	}

	if (sens)
	{	if (isIE)  // for IE
		{	img1.filters.alpha.opacity = opacity1 + coef * 100;
			img2.filters.alpha.opacity = opacity2 - coef * 100;
		}
		else // for Mozilla
		{	img1.style.MozOpacity = opacity1 + coef;
			img2.style.MozOpacity = opacity2 - coef;
		}
	}
	else
	{
		if (isIE)  // for IE
		{	img1.filters.alpha.opacity = opacity1 - coef * 100;
			img2.filters.alpha.opacity = opacity2 + coef * 100;
		}
		else // for Mozilla
		{	img1.style.MozOpacity = opacity1 - coef;
			img2.style.MozOpacity = opacity2 + coef;
		}
	}

	if (isIE)  // for IE
	{	opacity1 = parseFloat(img1.filters.alpha.opacity);
		opacity2 = parseFloat(img2.filters.alpha.opacity);
	}
	else       // for mozilla
	{	opacity1 = parseFloat(img1.style.MozOpacity);
		opacity2 = parseFloat(img2.style.MozOpacity);
	}

	// on fait varié le sens d'opacité du bazar
	if (opacity2  <= 0)
	{	img2.src=tabImg[indice++].src;
		sens = 0;
		if (indice == (tabImg.length)) indice=0;
		window.setTimeout("change_opacity()",temps_pause) ; // attente
		return 0;
	}
	else if (opacity1 <= 0)
	{	img1.src=tabImg[indice++].src;
		sens = 1;
		if (indice == (tabImg.length)) indice=0;
		window.setTimeout("change_opacity()",temps_pause) ; // attente
		return 0;
	}
	window.setTimeout("change_opacity()",temps) ; // recursion toutes les x millisec
}
-->