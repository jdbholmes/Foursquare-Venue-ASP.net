using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class venuelookup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Request.QueryString["venue"] != null)
            {
                VenueName.Text = Request.QueryString["venue"];
                VenueCity.Text = Request.QueryString["city"];
                VenueState.Text = Request.QueryString["state"];
                VenueZip.Text = Request.QueryString["zip"];

                venueaddress.Text = Request.QueryString["address"];

                ProcessRequest();
            }
        }
        else
        {
            ProcessRequest();
        }
    }

    private void ProcessRequest()
    {
        FormPanel.Visible = false;

        try
        {
            decimal lat, lng;

            string city = VenueCity.Text == "City" ? "" : VenueCity.Text;
            string state = VenueState.Text == "State" ? "" : VenueState.Text;
            string zip = VenueZip.Text == "Zip" ? "" : VenueZip.Text;
            string address = venueaddress.Text == "address" ? "" : venueaddress.Text;


            Geocoder.Geocode(city, state, zip, out lat, out lng);

            FourSquareAPI api = new FourSquareAPI("Basic c2plaHV0Y2hAZ21haWwuY29tOm5hdHJhdA==");
            Venue venue = api.GetMatchingVenues(lat, lng, VenueName.Text).FirstOrDefault();
            if (venue == null)
            {
                NoResultsPanel.Visible = true;
                return;
            }
            venue = api.GetVenueDetails(venue.ID.Value);
            if (venue == null)
            {
                // this shouldn't happen, but just in case
                NoResultsPanel.Visible = true;
                return;
            }

            ResultsPanel.Visible = true;
            Venue.Text = venue.Name;

            Address.Text = venue.Address;
            City.Text = venue.City;
            State.Text = venue.State;
            Zip.Text = venue.Zip;
            Checkins.Text = venue.Checkins.ToString();

            MayorLink.NavigateUrl = "http://foursquare.com/user/" + venue.Mayor.ID;
            MayorPic.ImageUrl = venue.Mayor.Photo;
            Mayor.Text = venue.Mayor.FirstName;
            MayorCheckins.Text = venue.MayorCheckins.ToString();

            HereNow.DataSource = (
                from ci in venue.HereNow
                orderby ci.Created descending
                select ci).Take(12);
            HereNow.DataBind();

            Tips.DataSource = venue.Tips.Take(3);
            Tips.DataBind();

            CatName.Text = venue.PrimaryCategory.FullPathName;
            CatImage.ImageUrl = venue.PrimaryCategory.IconURL;
            
        }
        catch (Exception ex)
        {
            Error.Text = ex.Message;
        }
    }
}
