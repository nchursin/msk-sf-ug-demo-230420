@isTest
public with sharing class Test_AccountListCtrl {
    static Integer s_num = 1;

    @isTest
    private static void testInit() {
        AccountData fakeData = (AccountData) Test.createStub(AccountData.class, new StubAccountData());

        AccountListCtrl controller = new AccountListCtrl();
        controller.accData = fakeData;
        controller.init();
        System.debug('controller.accounts >> ' + controller.accounts);
    }

    public class StubAccountData implements StubProvider {
        public Object handleMethodCall(
            Object stubbedObject,
            String stubbedMethodName,
            Type returnType,
            List<Type> listOfParamTypes,
            List<String> listOfParamNames,
            List<Object> listOfArgs
        ) {
            switch on stubbedMethodName {
                when 'selectAccounts' {
                    return generateFakeAccounts();
                }
                when else {
                    return null;
                }
            }
        }
    }

    public static List<Account> generateFakeAccounts() {
        Account acc = new Account(
            Id = getFakeId(Account.getSObjectType()),
            Name = 'Fake Account 1'
        );
        return new List<Account> { acc };
    }

    public static String getFakeId(Schema.SObjectType sot) {
        String result = String.valueOf(s_num++);
        return sot.getDescribe().getKeyPrefix() + 
            '0'.repeat(12-result.length()) + result;
    }
}
