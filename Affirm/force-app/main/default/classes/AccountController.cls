public with sharing class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name FROM Account LIMIT 5];
    }

    @AuraEnabled(cacheable=true)
    public static Account getAccountDetails(String accId) {
        return [SELECT Id, Name, Industry, Type, Owner.Name, Owner.FullPhotoUrl FROM Account WHERE Id =: accId];
    }
}
