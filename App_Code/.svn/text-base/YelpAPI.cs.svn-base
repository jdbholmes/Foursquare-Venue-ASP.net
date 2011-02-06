using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for YelpAPI
/// </summary>
public class YelpAPI
{
    private JavaScriptSerializer m_ser;

    public YelpAPI()
    {
        m_ser = new JavaScriptSerializer();
        m_ser.RegisterConverters(new JavaScriptConverter[] { new YelpDataConverter() });
    }

    public IEnumerable<Business> GetBusinesses(string term, string location)
    {
        return GetBusinesses(term, location, null);
    }

    public IEnumerable<Business> GetBusinesses(string term, string location, string category)
    {
        string url = string.Format(
            "http://api.yelp.com/business_review_search?term={0}&location={1}&ywsid=z0ay4qPCtiu409-SRflklQ&category={2}",
            term, location, category);

        string js = HttpFetcher.Get(url);
        return m_ser.Deserialize<IEnumerable<Business>> (js);
    }
}

class YelpDataConverter : JavaScriptConverter
{
    public override object Deserialize(IDictionary<string, object> dictionary, Type type, JavaScriptSerializer serializer)
    {
        if (type == typeof(IEnumerable<Business>))
        {
            List<Business> businesses = new List<Business>();
            if (dictionary.ContainsKey("businesses"))
            {
                ArrayList list = dictionary["businesses"] as ArrayList;
                foreach (IDictionary<string, object> data in list)
                {
                    businesses.Add(new Business(data));
                }
            }

            return businesses;
        }
        else
        {
            throw new NotImplementedException();
        }
    }

    public override IDictionary<string, object> Serialize(object obj, JavaScriptSerializer serializer)
    {
        // we only need Deserialize
        throw new NotImplementedException();
    }

    public override IEnumerable<Type> SupportedTypes
    {
        get 
        {
            return new Type[] { typeof(IEnumerable<Business>) };
        }
    }
}


public class Business
{
    public string ID { get; set; }
    public string Name { get; set; }
    public string Address1 { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }
    public string RatingImageURL { get; set; }
    public int? ReviewCount { get; set; }
    public string Phone { get; set; }
    public string PhotoURL { get; set; }
    public string URL { get; set; }

    public Business(IDictionary<string, object> dict)
    {
        SafeDictionary data = new SafeDictionary(dict);

        ID = data["id"] as string;
        Name = data["name"] as string;
        Address1 = data["address1"] as string;
        City = data["city"] as string;
        State = data["state"] as string;
        Zip = data["zip"] as string;
        RatingImageURL = data["rating_img_url"] as string;
        ReviewCount = data["review_count"] as int?;
        Phone = data["phone"] as string;
        PhotoURL = data["photo_url"] as string;
        URL = data["url"] as string;
    }
}
