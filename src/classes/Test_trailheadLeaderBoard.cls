@istest
private class Test_trailheadLeaderBoard
{

    @testsetup static void testdata()
    {
        Contact c = new contact();
        c.LastName = 'test';
        c.Total_Points__c = 1000;
        c.Points_check_in__c = 500;
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


}