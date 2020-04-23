public with sharing class AccountListCtrl {
    public List<AccountWrapper> accounts { get; set; }

    @TestVisible
    private AccountData accData;

    public AccountListCtrl() {
        this.accData = new AccountData();
        this.accounts = new List<AccountWrapper>();
    }

    public void init() {
        List<Account> accList = this.accData.selectAccounts();
        for (Account a : accList) {
            this.accounts.add(new AccountWrapper(a));
        }
    }

    public class AccountWrapper {
        public Id recordId;
        public String name;

        public AccountWrapper(Account acc) {
            this.recordId = acc.Id;
            this.name = acc.Name;
        }
    }
}
