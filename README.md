# Trailhead-Leaderboard
As part of the Salesforce Summer of Trailhead event we built a trailhead leaderboard that ran in a developer org.  Feel free to use this at your event, or any event for that matter where a point tracking leaderboard is used.  

This has been uploaded as an unmanaged package here:
https://login.salesforce.com/packaging/installPackage.apexp?p0=04t370000001V3w


<b>Summary</b>

The contact object has been used to store the participants in the event.  We've added custom fields to track points at check in, points total, and points earned "today".  We monitored the participants developer trailhead profile and manually updated the Total Points field which updated the visualforce page.  

The field "SF Dev User Id" was used to store the user id of thier developer profile (in the url of their trailhead profile) then the formula field "Trailhead URL" will populate a link for the user. Make sure their trailhead profile is public (they have to edit).

A recordtype and custom list view are included for easy edit.  A page layout for Contact is also included.



<b>Other items that are important:</b>

-A static resource contains the countdown js file.

-Trailhead Leaderboard Settings - This is a custom setting letting you change the Header Message, Finish Message, and Target Time of the countdown without having to edit the VF page.  The Target Time has to be a specific format like: 07/25/2015 1:00 PM UTC-0400

-You can access the Visualforce page for results but our group also did a public facing Site so we could share externally.

-To access the Visualforce page, I've included a Custom Link "Trailhead Leaderboard" you can add to your homepage.  You can also browse to "/apex/trailheadLeaderBoard" in your environment.


<b>Update 03/31/2017</b>
For Southeast Dreamin 2017 we added a Lightning Component and its used (with Lightning Out) in a new Visualforce page: trailheadLeaderBoard_LC

We also added new fields on the Contact tracking badges and trails, along with tracking hourly points.

Automation has been added with class Queueable_GetTrailheadData (caution: its doing a screen scrape) and with some apex scripts AutomationScripts.cls which will do a mass check-in for all participants, clear out hourly points, and call the Queueable_GetTrailheadData class.
