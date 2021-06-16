# Mobile Number Formatter Task
A simple module to format UK phone numbers for usage with Twilio's API built using Ruby and tested using RSpec testing
suite.

## Task Requirements
Customer's input their phone number on checkout so they can be sent SMS messages to remind them that their order is
coming, and other useful information about their delivery. Twilio is used to send the actual messages, and Twilio
require the phone number to be formatted correctly before being sent to Twilio, including the +44 prefix.

On checkout, customers are able to input their phone number in any of the following formats:

 - +447...
 - 447...
 - 07....

UK mobile phone numbers are **11 digits long** when in the 07... format (There are some exceptions, but these can be
ignored), and always have a 7 after the prefix (whether it's +44, 44 or 0). What we're looking for you to do is the
following:

  1. Using Test Driven Development, Build a spec for a Formatter::PhoneNumber::UK#format method that takes in a phone
  number, removes any spaces, checks it is valid (raises an error if not), and outputs it in the +447... format.
  2. Implement the Formatter::PhoneNumber::UK#format method to ensure the tests pass.
  3. Implement error classes for the different errors that can occur during the formatting

For example, if I call format with 071234 56789 as the input, it should return +447123456789. If I call it with 0634343,
it should raise an error.

## Approach
I have followed the approach of using a Module rather than a class as outlined in the instructions, but normally I
would have done this in a class.

Using a test first approach I created some tests for the different scenarios that are present in this particular
exercise which I deemed to be as follows:

  1. Different prefixes to the number
  2. Unwanted whitespace
  3. Incorrect length of number
  4. Incorrect format, meaning that the prefix is not followed by the number 7

Once the tests were completed I then moved on to solving the problem.

I also used Rubocop for linting purposes.

## Installation
Navigate to the root directory and run:

```bash
bundle install
```

Tests can then be ran using:

```bash
rspec spec/
```