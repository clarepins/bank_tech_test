# Bank tech test

- This test focuses on code quality, TDD and OOD principles.
- Instructions [here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md).

## Instructions for use
- Ruby version is 2.6.0
- Run $`bundle`
- Use REPL e.g. IRB to interact with the app e.g. see feature test below.

### Test instructions
- Feature tests in IRB (from root), also [`feature_test_spec.rb`](https://github.com/clarepins/bank_tech_test/blob/master/spec/feature_test_spec.rb):
  - `require './lib/bank_account.rb'`
  - `account = BankAccount.new`
  - `account.add_transaction(1000)`
  - `account.add_transaction(2000)`
  - `account.add_transaction(-500)`
  - `account.print_statement`
  - expect to see:
    - date || credit || debit || balance
    - 14/01/2012 || || 500.00 || 2500.00
    - 13/01/2012 || 2000.00 || || 3000.00
    - 10/01/2012 || 1000.00 || || 1000.00
- Unit tests: run $`rspec`
- all tests pass with 100% test coverage.
