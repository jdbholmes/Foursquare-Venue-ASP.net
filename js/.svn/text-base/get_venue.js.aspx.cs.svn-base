using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class js_get_venue_js : System.Web.UI.Page
{
    protected string Host {get; set;}

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/javascript";
        Host = Request.Url.Scheme + "://" + Request.Url.Host;
    }
}
