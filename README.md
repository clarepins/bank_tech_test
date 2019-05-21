# Bank tech test

- This test focuses on code quality, TDD and OOD principles.

## Requirements
* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).
* Full spec [here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md).

## Acceptance criteria
**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Instructions for use
- Ruby version is 2.6.0
- Run $`bundle`
- Use REPL e.g. IRB to interact with the app. You can use the app in the manner described in the feature tests below.

### Test instructions
- Feature tests in IRB (from root), also [`feature_test_spec.rb`](https://github.com/clarepins/bank_tech_test/blob/master/spec/feature_test_spec.rb):
  - `require './lib/bank_account.rb'`
  - `account = BankAccount.new`
  - `account.add_transaction(1000)`
  - `account.add_transaction(2000)`
  - `account.add_transaction(-500)`
  - `account.print_statement`
  - expect to see acceptance criteria (above)
- Unit tests: run $`rspec`
- all tests pass with 100% test coverage.

### Diagram of model
I drew this diagram to help me map out how classes would interact when I broke 1 class into 3. It may help you understand class structure.
![](https://github.com/clarepins/bank_tech_test/blob/master/bank_account_diagram.JPG)
