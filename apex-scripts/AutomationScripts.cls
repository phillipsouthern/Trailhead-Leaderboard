//Event Check in script to start
List<Contact> contacts = [Select Id, Total_Points__c, 
                          Points_Check_In__c, Total_Badges__c, Badges_Check_In__c,
                          Total_Trails__c, Trails_Check_In__c from Contact
                          Where Active__c = true];
for(Contact c : contacts)
{
    c.Points_Check_In__c = c.Total_Points__c;
    c.Badges_Check_In__c = c.Total_Badges__c;
    c.Trails_Check_In__c = c.Total_Trails__c;
    
}
update contacts;


//Hourly check in script - This resets the points earned for the hour.
List<Contact> contacts2 = [Select Id, Points_Last_Hour_Check_In__c, 
                          Points_Today__c, Total_Points__c from Contact
                          Where Active__c = true];
for(Contact c : contacts2)
{
    c.Points_Last_Hour_Check_In__c = c.Total_Points__c;
}
update contacts2;

//Pull data from Trailhead pages
List<Contact> trailheadUsers = [Select Id, SF_Dev_User_Id__c, Total_Badges__c, Total_Points__c, Total_Trails__c 
                                      from Contact 
                                      Where Active__c = true
                                      AND SF_Dev_User_Id__c != null];
        
if(!trailheadUsers.isEmpty())
{
    Queueable_GetTrailheadData refreshData = new Queueable_GetTrailheadData();
    refreshData.contacts = trailheadUsers;
    
    System.enqueueJob(refreshData);
}