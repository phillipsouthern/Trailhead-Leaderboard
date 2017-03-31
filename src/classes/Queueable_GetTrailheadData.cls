public class Queueable_GetTrailheadData implements Queueable, Database.allowsCallouts
{
    public List<Contact> contacts;

    public void execute(QueueableContext context) 
    {
		for(Contact c : contacts)
        {
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://trailhead.salesforce.com/users/profiles/' + c.SF_Dev_User_Id__c);
            req.setMethod('GET');
            Http http = new Http();
            HTTPResponse res = http.send(req);
            
            String responseBody = res.getBody();
            List<String> parts = responseBody.split('</h4>');
            String h4Header = '<h4 class=\'th-profile-title th-profile-title--green leading-marg-m\'>';
            c.Total_Badges__c = Integer.valueOf(parts[0].substringAfter(h4Header).trim().remove(','));
            c.Total_Points__c = Integer.valueOf(parts[1].substringAfter(h4Header).trim().remove(','));
            c.Total_Trails__c = Integer.valueOf(parts[2].substringAfter(h4Header).trim().remove(','));
            c.Last_Check__c = system.now();
        }
        
        
        update contacts;
    }

}