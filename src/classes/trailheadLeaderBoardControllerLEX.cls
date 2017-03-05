public class trailheadLeaderBoardControllerLEX
{

    @AuraEnabled
    public static Trailhead_Leaderboard_Settings__c gettrailSettings()
    {
        return Trailhead_Leaderboard_Settings__c.getinstance();
    }
    
    @AuraEnabled
    public static List<ContactWrapper> getContacts()
    {
        List<ContactWrapper> contacts = new List<ContactWrapper>();
        
        Integer x = 0;
        for(Contact c :  [Select Id, Name, Points_Today__c, Total_Points__c,  Points_Check_In__c,
                            Twitter_Url__c, Trailhead_URL__c, SF_Dev_User_Id__c
                        from Contact 
                        Where Points_Check_In__c != null
                        Order by Points_today__c DESC])
        {
            x++;
            contacts.add(new ContactWrapper(c,x));
        
        }
        
        return contacts;
    }
    
	/*  
    public class ContactWrapper
    {
        public Integer count{get;set;}
        public Contact c {get;set;}
        
        public ContactWrapper(Contact c, Integer x)
        {
            this.c = c;
            count = x;
        }
    
    }
	*/


}