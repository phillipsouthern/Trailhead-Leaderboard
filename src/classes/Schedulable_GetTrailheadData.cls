global class Schedulable_GetTrailheadData implements Schedulable
{
	global void execute(SchedulableContext sc) 
    {
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
   }
}