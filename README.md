# Demo Repository for article about Communication between Docker containers and Host

Note: All the scripts are just written in Powershell due to the focus is Docker Desktop for Windows.
They can however easily (1:1) be ported to Linux / MacOS bash scripts.

<b>Note</b>:<br/>
You must allow Powershell scripts to be executed:
Verify by opening a Powershell window and type: `Get-ExecutionPolicy`.<br/>
This should give you a result of either `Unrestricted` or `RemoteSigned`. If this is not the case, then run: `Set-ExecutionPolicy RemoteSigned` (admin permissions might be needed).


## Build

Execute `.\docker-infrastructure\build-all.ps1`

This creates the Docker Images (and JAR artefacts) for both `service-a` and `service-b`

## Run

There are three scenarios of how to run both services. 
No matter which scenario is run, both services can always be accessed in your browser by
```http://localhost:9999/serviceA``` (ServiceA)<br/>
```http://localhost:7777/serviceB/call-service-a``` (ServiceB which requests also an endpoint of ServiceA)


### Scenario: Run all as Docker containers

Execute `.\docker-infrastructure\run-all-in-docker.ps1` 

### Scenario: Run ServiceA as Docker container and ServiceB on your host

Execute `.\docker-infrastructure\run-host-2-docker.ps1` and execute in another Powershell-Window `.\service-b\run-app.ps1`

### Scenario: Run ServiceA as Docker container and ServiceB on your host

Execute `.\docker-infrastructure\run-docker-2-host.ps1` and execute in another Powershell-Window `.\service-a\run-app.ps1`

Note that an .env file is created in the docker-infrastructure folder.

## Link to article

https://medium.com/@clemensstich/docker-to-host-communication-9900a452c0b9

