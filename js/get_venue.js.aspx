<%@ Page Language="C#" AutoEventWireup="true" CodeFile="get_venue.js.aspx.cs" Inherits="js_get_venue_js" %>
var host = "<%= Host %>";

function popupVenueForm(venue, city, state, zip)
{
    var url = host + "/venueform.aspx?";
    if(venue) url += "venue=" + venue + "&";
    if(city) url += "city=" + city + "&";
    if(state) url += "state=" + state + "&";
    if(zip) url += "zip=" + zip;
    
    $("a.get_venue_link").fancybox({
        href: url,
        type: 'iframe',
        width: 200
    });
    $("a.get_venue_link").trigger("click");
}

function popupYelpForm(search, city, state, zip)
{
    var url = host + "/yelpform.aspx?";
    if(search) url += "search=" + search + "&";
    if(city) url += "city=" + city + "&";
    if(state) url += "state=" + state + "&";
    if(zip) url += "zip=" + zip;
    
    $("a.get_venue_link").fancybox({
        href: url,
        type: 'iframe',
        width: 200
    });
    $("a.get_venue_link").trigger("click");
}


function includeJs(jsFile)
{
  document.write('<scr' + 'ipt type="text/javascript" src="'+ host + jsFile + '"></scr' + 'ipt>'); 
}

function includeCss(cssFile)
{
  document.write('<link rel="stylesheet" href="'+ host + cssFile + '"></link>'); 
}

includeJs('/js/jquery-1.4.2.min.js');
includeJs('/js/jquery.fancybox.js');
includeCss('/css/jquery.fancybox-1.3.1.css');

document.write("<div style='display: none'><a class='get_venue_link' href='#'>go</a></div>");
