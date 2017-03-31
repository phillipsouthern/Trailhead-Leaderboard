public class ContactWrapper 
{
	@AuraEnabled public Integer count{get;set;}
    @AuraEnabled public Contact c {get;set;}
    
    public ContactWrapper(Contact c, Integer x)
    {
        this.c = c;
        count = x;
    }
}