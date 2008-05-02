function executeMap()
{
	try
	{
		showMap();
	}
	catch(e)
	{

		setTimeout('executeMap()',200);
	}
}