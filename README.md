# Bitcoin Tracker

This is a simple application where a user can select a currency and view the latest bitcoin price for the selected currency.

## Getting Started

Steps to run this application are as follows:-

1. Clone this repo using the command below

```bash
git clone https://github.com/bhushan-r-mahajan/bitcoin-tracker.git
```
2. After cloning create a .env file in your root folder.
3. Add the code given below in that .env file. (The endpoints should not be exposed in a production application hence we use .env).
```bash
API_URL="https://api.coindesk.com/v1/bpi/currentprice.json"
```
4. Run the application using android/iOS simulator or on chrome for testing the applications on all device types.