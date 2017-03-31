@istest
private class Test_trailheadLeaderBoard
{

    @testsetup static void testdata()
    {
        Contact c = new contact();
        c.LastName = 'test';
        c.Total_Points__c = 1000;
        c.Points_check_in__c = 500;
        c.SF_Dev_User_Id__c = '11111111';
        c.Active__c = true;
        insert c;
        
        Trailhead_Leaderboard_Settings__c ts = new Trailhead_Leaderboard_Settings__c();
        ts.name = 'test';
        ts.Finish_Message__c = 'test';
        ts.Header_Message__c = 'test';
        ts.Target_time__c = '07/26/2015 1:00 PM UTC-0630';
        insert ts;
        
    }
    
    @istest static void testController()
    {
        PageReference pageRef = Page.trailheadLeaderboard;
        Test.setCurrentPage(pageRef);

        trailheadLeaderboardController tl = new trailheadleaderboardcontroller();
        
    }
    
    @istest static void testLEXComponent()
    {
        PageReference pageRef = Page.trailheadLeaderboard_LC;
        Test.setCurrentPage(pageRef);

        List<ContactWrapper> cw = trailheadLeaderboardControllerLEX.getContacts();
        
        Trailhead_Leaderboard_Settings__c ts = trailheadLeaderboardControllerLEX.getTrailSettings();
        
    }
    
    @istest static void testautomation()
    {

        Test.setMock(HttpCalloutMock.class, new Mock_LeaderboardAutomation());
        
        test.starttest();
        
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
        
        test.stoptest();
    }


}