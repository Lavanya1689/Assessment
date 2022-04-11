@isTest
class ContactTriggerHandlerTest {
    
    @isTest
    static void validateContactUpdates() {
        Account a1 = new Account();
        a1.Name = 'Test Account';
        a1.Industry = 'Tech';
        insert a1;

        Contact c = new Contact();
        c.AccountId = a1.Id;
        c.FirstName = 'Lavanya';
        c.LastName = 'Tangati';
        insert c;

        c = [SELECT Id, Account_Industry__c FROM Contact];
        System.assert(c.Account_Industry__c == 'Tech');

        c.Account_Industry__c = 'Marketing';
        update c;

        c = [SELECT Id, Account_Industry__c FROM Contact];
        System.assert(c.Account_Industry__c == 'Tech');

        Account a2 = new Account();
        a2.Name = 'Test Account 2';
        a2.Industry = 'Marketing';
        insert a2;

        c.AccountId = a2.Id;
        update c;

        c = [SELECT Id, Account_Industry__c FROM Contact];
        System.assert(c.Account_Industry__c == 'Marketing');
    }
}
