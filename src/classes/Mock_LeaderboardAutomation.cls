@isTest
global class Mock_LeaderboardAutomation implements HttpCalloutMock 
{  
    global HTTPResponse respond(HTTPRequest req)
    {   
        // Create a fake response
        HttpResponse res = new HttpResponse();
        //res.setHeader('Content-Type', 'application/json');

        string body = '<h4 class=\'th-profile-title th-profile-title--green leading-marg-m\'>71</h4><h4 class=\'th-profile-title th-profile-title--green leading-marg-m\'>49,525</h4><h4 class=\'th-profile-title th-profile-title--green leading-marg-m\'>4</h4>';
        res.setBody(body);
        res.setStatusCode(200);
        return res;
    }
}