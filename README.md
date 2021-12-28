# powershell-apple-store-mbp-checker
Checks for a specific model of MBP in stock at an Apple Store

## Docker Run Commands

First, find the store number of your local Apple Store using this table.
https://github.com/worthbak/apple-store-inventory-checker/blob/main/apple-store-numbers.md

```sh
sudo docker run --rm yenba/powershellapplechecker pwsh -File ./AppleStoreChecker.ps1 -model "ENTER_MODEL_HERE" -store "ENTER_STORE_HERE" -pushover_user "PUSHOVER_API_USER" -pushover_token "PUSHOVER_API_TOKEN"
```
