public with sharing class AccountController {

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey) {
        system.System.debug('****findAccounts****');
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, AccountNumber FROM Account WHERE Name LIKE :key  LIMIT 10];
    }

}