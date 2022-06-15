# SSH Public Key Authentication 
Create SSH keys for authentication between source and target servers. Read more about this [here](https://www.ssh.com/academy/ssh/public-key-authentication)

## About
Creates the ability to auto-login via ssh between source and target server accounts in Linux. Your source account is your current login and your target account is specified as a parameter to the script. Note this will require multiple password logins to the target server to complete the setup 

## Examples 
Simple key setup. Here without a target username specified it assumes your existing user ID
``` bash
[zavoraad@foo.com ~/]$ ./ssh_key_gen.sh bar.com
#<you'll enter target pw multiple times here> 
[zavoraad@foo.com ~/]$ ssh bar.com
[zavoraad@bar.com ~/]$ 
```
Specify a different username for target server
``` bash
[zavoraad@foo.com ~/]$ ./ssh_key_gen.sh aaron@bar.com
#<you'll enter target pw multiple times here> 
[zavoraad@foo.com ~/]$ ssh aaron@bar.com
[aaron@bar.com ~/]$ 
```


