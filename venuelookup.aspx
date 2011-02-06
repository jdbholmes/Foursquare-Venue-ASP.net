<%@ Page Language="C#" AutoEventWireup="true" CodeFile="venuelookup.aspx.cs" Inherits="venuelookup" %>
<html>
<head>
  
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.watermark.js"></script>
    <script>
        $(document).ready(function() {

            $("input.watermark").each(function() {
                $(this).watermark($(this).attr("watermark"));
            });

        });

    </script>
</head>
</html>

<form id="VenueForm" class="venue_form" runat="server" method="post">

<asp:Panel id="FormPanel" runat="server">
    <div class="venue_form_wrap">
    <h3>Enter Venue Info (be specific)</h3>
    <div><label>Venue Name (Wal mart)</label></div>
        <div class="venue_input"><asp:TextBox id="VenueName" runat="server" class="watermark" watermark="Venue Name" /></div>
        <div><label>Venue City</label></div>
        <div class="venue_input"><asp:TextBox id="VenueCity" runat="server" class="watermark" watermark="City" /></div>
        <div><label>Venue State</label></div>
        <div class="venue_input"><asp:TextBox id="VenueState" runat="server" class="watermark" watermark="State" /></div>
        <div><label>Venue Zip</label></div>
        <div class="venue_input"><asp:TextBox id="VenueZip" runat="server" class="watermark" watermark="Zip" /></div>
        <div><label>Venue Address</label></div>
         <div class="venue_input"><asp:TextBox id="venueaddress" runat="server" class="watermark" watermark="address" /></div>
        <div><asp:Button id="Submit" runat="server" Text="Submit" /></div>
    </div>
</asp:Panel>

<asp:Panel id="NoResultsPanel" Visible="false" runat="server">
    <div>No results found</div>
</asp:Panel>

<asp:Panel id="ResultsPanel" Visible="false" runat="server">
<div id="container">
<h1>CM Foursquare Widget</h1>
<div id="content">
        <div class="info"> 
    <h2><asp:Label id="Venue" runat="server" /></h2>
     <p class="address"><asp:Label id="Address" runat="server" />
 
        <asp:Label id="City" runat="server" />, 
        <asp:Label id="State" runat="server" />
        <asp:Label id="Zip" runat="server" />
        </p>
    
      <p class="checkins"><asp:Label id="Checkins" runat="server" /> checkins</p>
      </div>  
      <div class="divider"></div> 
     
    <div class="catimage"><asp:Image id="CatImage" runat="server" /></div>
    <div class="catname"><asp:Label id="CatName" runat="server" /></div>
    <div style="clear: both"></div>
     <div class="divider"></div> 
   
    <div class="info mayor">            <h3>Mayor</h3> 
    <div class="mayor">
     <asp:HyperLink id="MayorLink" runat="server" target="_blank"><asp:Image id="MayorPic" runat="server" style="width: 40px; height: 40px" /></asp:HyperLink>
     <p class="mayor-name"><strong><asp:Label id="Mayor" runat="server" /></strong> is currently the mayor and has checked in <asp:Label id="MayorCheckins" runat="server" /> times.</p> 
               <div class="clear"></div>        </div>    
       
      
        <div style="clear: both"></div>
    </div>
     <div class="divider"></div> 
  
    
    <div class="info herenow">
               <h3>Here Now</h3> 
    <div class="herenow">
     <p>
    <asp:Repeater id="HereNow" runat="server">
        <ItemTemplate>
            
                <a href="http://foursquare.com/user/<%# Eval("User.ID") %>" target="_blank"><img src="<%# Eval("User.Photo") %>" style="width: 40px; height: 40px" /></a>
          
        </ItemTemplate>
    </asp:Repeater>
    </p>
    </div>
   </div>
    <div style="clear: both"></div>
    </div>
     <div class="divider"></div> 
    <div class="info tips">
     <h3>Tips</h3> 
    <asp:Repeater id="Tips" runat="server">
        <ItemTemplate>
            <p><strong>
                <a href="http://foursquare.com/user/<%# Eval("User.ID") %>" target="_blank"><b><%# Eval("User.FirstName") %></b></a>
                <%# Eval("Text") %>
                  </strong>
                </p>
        </ItemTemplate>
    </asp:Repeater>
    
   
    <div><asp:Label id="Error" runat="server" /></div>
</div>
</div>


</asp:Panel>

</form>



