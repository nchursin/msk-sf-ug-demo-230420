# Environment Setup and Test Automation Demo

This is a tiny app which demoes scripts for env setup and test automation.

## Setup scripts
Setup scripts are stored in `./setup` folder.

1. `orgSetup.sh` builds Angular app and deploys code
1. `test.sh` runs ng and apex tests
1. `orgSpinup.sh` creates a scratch org and executes `orgSetup.sh` and `test.sh`

## Stub API

`app/stubs/tests/Test_AccountListCtrl.cls` shows an example of Stub API usage for faking data. `AccountData` class is stubbed with a fake data provider.