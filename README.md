# Bank Tech Test
Bank – Technical Test: code quality; best practices; process.

### Acceptance Criteria

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
```

## Domain Model

## Class Diagrams

## Technologies Used

## Development

```
ruby
```

### Testing and Code Quality

```
RSpec
Capybara
Rubocop
Simplecov
```

## How To Run The Program

## Future Improvements
