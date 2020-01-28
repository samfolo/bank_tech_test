# Bank Tech Test
Bank – Technical Test: code quality; best practices; process.

### Acceptance Criteria

```
**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories

```
As a customer
So that I can manage my money
I would like access to a bank account

As a customer
So that I can keep all my earnings in one place
I would like to be able to make a deposit

As a customer
So that I can spend my earnings as and when I need to
I would like to be able to make withdrawals

As a customer
So that I can keep track of how much money I have
I would like to view my current balance

As a customer
So that I can keep track of my spending habits
I would like to be able to print out my bank balance

––––––––––

As a bank CEO
So that customers are unable to withdraw an infinite amount
I would like them to be alerted when they attempt to withdraw more money than they have

As a bank CEO
So that customers cannot make redundant deposits
I would like all deposits to be a minimum of 5 coins

As a bank CEO
So that customers cannot make redundant withdrawals
I would like all withdrawals to be a minimum of 5 coins
```

## Domain Model

While working through the user stories, I found it helpful to split out any and all keywords into a list of nouns and verbs; this helps with planning out which methods and pieces of state the program will need, avoiding any superfluous logic and keeping the development process on track.  Nouns often become pieces of state, whereas the verbs often become methods and means of interacting with the available data.  Most of the keywords are user-related, so I'll be expecting mostly user-facing classes and methods.

| Nouns         | Verbs         |
| :------------ |:--------------|
| `deposit`      | `deposit` |
| `amount`      | `print` |
| `date` | `see` |
| `bank statement` | `withdraw` |
| `credit` | `manage` |
| `debit` | `access` |
| `balance` | `keep track of` |
| `withdrawal` | `alerted` |
|  `earnings` | `cannot` |
| `redundant deposit/withdrawal` | |
| `minimum` | |
| `bank` | |
| `bank account` | |

## Class Diagrams

Once the nouns and verbs have been split, I wanted to divide the potential methods and pieces of state between potential classes.  Class Diagrams allow me to begin to think about flow of data around the application – which parts will be accessible to the user and which parts of the program be abstracted away.  Keeping the classes as lean as possible – giving each a small piece of logic to deal with – allows for much easier maintenance and presents more opportunities for scaling should the owner require.


| BankAccount                 | Deposit           | Withdrawal        | Transactions         | Bank                                      | Authentication |
| :-------------------------- | :---------------- | :---------------- | :-----------------   | :---------------------------------------- | :---- |
|                             |                   |                   |                      |                                           |                |
| `@balance`                  | `@amount`         | `@amount`         | `@transactions`      | `@bank_accounts`                          | `@pin_number`  |
| `@transactions`             | `@date`           | `@date`           |                      | `@account (tracked-account)`              |                |
| `@authentication`           | `@logged_balance` | `@logged_balance` |                      |                                           |                |
| `@locked`                   |                   |                   |                      |                                           |                |
|                             |                   |                   |                      |                                           |                |
| `#deposit`                  | `#view_amount`    | `#view_amount`    | `#log_data`          | `#self.open_account_for`                  | `#verify`      |
| `#withdraw`                 | `#date_created`   | `#date_created`   |                      | `#self.account_for`                       |                |
| `#view_balance`             | `#log_line`       | `#log_line`       |                      |                                           |                |
| `#print_statement`          |                   |                   |                      |                                           |                |
| `#enter_pin`                |                   |                   |                      |                                           |                |
|                             |                   |                   |                      |                                           |                |
| `::UNAUTHORISED`            | `::CURRENT_DATE`  | `::CURRENT_DATE`  |                      | `::NON_EXISTENT_ACCOUNT`                  |                |
| `::INSUFFICIENT_FUNDS`      |                   |                   |                      |                                           |                |
| `::INSUFFICIENT_DEPOSIT`    |                   |                   |                      |                                           |                |
| `::INSUFFICIENT_WITHDRAWAL` |                   |                   |                      |                                           |                |

## Technologies Used

### Development

```
ruby
```

### Testing and Code Quality

```
rspec
capybara
rubocop 0.71.0
simplecov
simplecov-console
```

## How To Run The Program

## Future Improvements
