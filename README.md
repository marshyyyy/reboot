# reboot
reboot a computer, an easier way

Reboot a computer by specifying minutes, hours, or days or  
by specifying a specific time. 

![example](https://imgur.com/GmN7A9k.png)

## Installation
Download file to a directory in your $env:PATH

## Usage
`reboot [option] [time]`  
`%s		- second`  
`%m		- minute`  
`%h		- hour`  
`%d		- day`  
`-t		- specifies an exact time`  **Note:** must use 24 hour format

#### Examples
`PS> reboot 15m` 		this will reboot the computer in 15 **m**inutes  
`PS> reboot 12h` 		this will reboot the computer in 12 **h**ours  
`PS> reboot 22:00`	this will reboot the computer at 10:00 PM
