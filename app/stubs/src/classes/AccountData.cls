public with sharing class AccountData {
    public List<Account> selectAccounts() {
        return [
            SELECT Id, Name
            FROM Account
        ];
    }
}
