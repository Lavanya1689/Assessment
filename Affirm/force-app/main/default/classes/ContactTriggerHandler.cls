public class ContactTriggerHandler {
    List<Contact> newList; 
    Map<Id, Contact> oldMap;
    Set<Id> accountIds;

    public ContactTriggerHandler(List<Contact> newList, Map<Id, Contact> oldMap) {
        this.newList = newList;
        this.oldMap = oldMap;
        accountIds =  new Set<Id>();
    }

    public void execute(){
        for(Contact c : newList){
            if(
                c.AccountId !=  null 
                && 
                (
                    oldMap ==  null 
                    || 
                    (
                        oldMap != null && (c.AccountId != oldMap.get(c.Id).AccountId || c.Account_Industry__c != oldMap.get(c.Id).Account_Industry__c)
                    )
                )
            ){
                accountIds.add(c.AccountId);
            }
        }

        if(!accountIds.isEmpty()){
            for(Contact c : newList){
                c.Account_Industry__c = accountMap.get(c.AccountId).Industry;
            }
        }
    }

    private Map<Id, Account> accountMap{
        get{
            if(accountMap == null){
                accountMap =  new Map<Id, Account>([SELECT Id, Industry FROM Account WHERE ID IN: accountIds]);
            }
            return accountMap;
        }
        private set;
    }
}
