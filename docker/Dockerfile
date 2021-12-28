# syntax=docker/dockerfile:1

# use the 730MB sdk image to build
FROM mcr.microsoft.com/dotnet/sdk as builder

# install the latest version of PowerShell
RUN dotnet tool install -g PowerShell

# discard all that builder data then just copy the required changed files from "builder" to the smaller 180MB base image
FROM mcr.microsoft.com/dotnet/runtime
COPY --from=builder /root/.dotnet/tools/ /bin

RUN bash
RUN mkdir /app
WORKDIR /app
RUN apt update && apt upgrade
RUN apt install git -y
RUN git clone https://github.com/yenba/powershell-apple-store-mbp-checker.git
WORKDIR /app/powershell-apple-store-mbp-checker

# run powershell
CMD [ "pwsh", "-File" , "./AppleStoreChecker.ps1" ]
