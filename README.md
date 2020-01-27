# Bank Tech Test
Bank – Technical Test: code quality; best practices; process.

## User Stories

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
