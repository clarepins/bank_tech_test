# Bank tech test

- This test focuses on code quality, TDD and OOD principles.
- Instructions [here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md).

## Instructions for use
- Ruby version is 2.6.0
- Run $`bundle`
- Run $`rspec --init`
- Use REPL e.g. IRP to interact with the app:

### Test instructions
- Feature tests in IRB (from root):
  - `require './lib/bank_account.rb'`
  - `account = BankAccount.new`
  - `account.deposit(10)`
  - `account.withdraw(5)`
  - `acount.print_statement`
  - expect to see:
date || credit || debit || balance
[today's date] || || 5.00 || 5.00
[today's date] || 10.00 || || 10.00
- Unit tests: run $`rspec`
