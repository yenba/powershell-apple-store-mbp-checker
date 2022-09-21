# Powershell Apple Store MBP Stock Checker

This is a Powershell script that checks to see if a specific model of Macbook Pro is in stock at a specific Apple Store. It has been containerized into a Docker container for ease of use across multiple OS’s. 

## Prerequisites

- **Apple Store Number (`store`)**
    - Find the store number of your local Apple Store using this table.
    [https://github.com/worthbak/apple-store-inventory-checker/blob/main/apple-store-numbers.md](https://github.com/worthbak/apple-store-inventory-checker/blob/main/apple-store-numbers.md)
- **Macbook Pro Model Number (`model`)**
    - Find the model number of the Macbook Pro you are searching for. You can find a list of model numbers here. [https://everymac.com/systems/apple/macbook_pro/index-macbookpro.html](https://everymac.com/systems/apple/macbook_pro/index-macbookpro.html)
- **Pushover Account**
    - Notifications are achieved by utilizing [Pushover](https://pushover.net/). You will need to create a Pushover account to properly run this script.
- **Pushover API User Key (`pushover_user`)**
    - Documentation is here - [https://pushover.net/api](https://pushover.net/api)
- **Pushover API Token (`pushover_token`)**
    - Documentation is here - [https://pushover.net/api](https://pushover.net/api)

## Docker Hub Repo

[https://hub.docker.com/r/yenba/powershellapplechecker](https://hub.docker.com/r/yenba/powershellapplechecker)

## Docker Run Command

```
sudo docker run --rm yenba/powershellapplechecker pwsh -File ./AppleStoreChecker.ps1 -model "ENTER_MODEL_HERE" -store "ENTER_STORE_HERE" -pushover_user "PUSHOVER_API_USER" -pushover_token "PUSHOVER_API_TOKEN"
```
