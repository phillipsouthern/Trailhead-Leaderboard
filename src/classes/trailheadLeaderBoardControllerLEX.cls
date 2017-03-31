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
        for(Contact c :  [Select Id, Display_Name__c, Points_Today__c, Total_Points__c,  Points_Check_In__c,
                            Twitter_Url__c, Trailhead_URL__c, SF_Dev_User_Id__c, Badges_Today__c, Total_Badges__c, 
                          	Badges_Check_In__c, Trails_Today__c, Total_Trails__c, Trails_Check_In__c, Points_This_Hour__c,
                            Points_Last_Hour_Check_In__c
                        from Contact
                        Where Active__c = true
                        Order by Points_Today__c DESC])
                        //Order by Points_This_Hour__c DESC])
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