param ($model, $store, $pushover_user, $pushover_token)

function CheckAppleStore {
    param (
        $model, $store
    )
    $request = Invoke-RestMethod -Uri "https://www.apple.com/us-edu/shop/fulfillment-messages?parts.0=$model&mt=regular&option.0=065-CCVF%2C065-CCVV%2C065-CCVY%2C065-CCW8%2C065-CCYN%2C065-CD3P&store=$store&_=1640643382328" -ContentType "application/json" -Method Get | ConvertFrom-Json -AsHashtable

    $status = $request.body.content.pickupMessage.stores.partsAvailability.$model.pickupDisplay
    $statusPretty = $request.body.content.pickupMessage.stores.partsAvailability.$model.pickupSearchQuote
    $statusFull = $request.body.content.pickupMessage.stores.partsAvailability.$model.storePickupQuote
    $statusAll = $request.body.content.pickupMessage.stores.partsAvailability.$model

    $Time = Get-Date -Format "MM/dd/yyyy hh:mm tt"

    if ($status -eq "available" ) {
        $Message = "$Time - It's in stock! Pick up is $statusFull."
        Write-Host $Message
        $post = Invoke-RestMethod -Uri "https://api.pushover.net/1/messages.json?token=$pushover_token&user=$pushover_user&message=$Message" -Method Post
        $true
    }
    else {
        $Message = "$Time - It's not in stock. Sorry! $statusFull."
        Write-Host $Message
        $false
    }
}

CheckAppleStore -model "$model" -store "$store"