# **Configuration**

## Step 1 - **Sudo**

In Linux, `sudo` (short for "superuser do") is a command that allows users to run programs with the security privileges of another user, typically the superuser or root.

When a user executes a command with `sudo`, the system prompts them to enter their own password. If the user has the necessary permissions, the command is executed with superuser rights.

The `/etc/sudoers` file is crucial for configuring `sudo`. It specifies which users or groups can run specific commands as superusers, offering detailed control over permissions.

All commands executed with `sudo` are logged, creating an audit trail of who executed what commands.

Overall, `sudo` is an essential tool for managing permissions in Linux, striking a balance between flexibility and security.

1. Install sudo and add your username to the groups as specified in the project requirements.

```bash
# switch to the root user and change to the root's home directory
su -

# install the sudo package
apt install sudo

# display the installed version of sudo
sudo --version | head -n 1

# create a new group 'user42'
groupadd user42

# add user to both groups
usermod -aG sudo,user42 user_name

# display all groups the user belongs to
groups user_name

# retrieve group information
getent group user42
```

1. Set up the configuration for your sudo group.

```bash
# сreate a directory for storing sudo logs
mkdir /var/log/sudo

# сreate a log file for sudo
touch /var/log/sudo/sudo.log

# edit the sudoers file to set custom policies
visudo
```

Inside the `visudo` editor, add the following parameters to configure sudo:

```arduino
Defaults passwd_tries=3
Defaults badpass_message="Custom message here"
Defaults logfile="/var/log/sudo/sudo.log"
Defaults log_input, log_output
Defaults iolog_dir="/var/log/sudo"
Defaults requiretty

# edit secure path
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin**:/snap/bin**"
```

<aside>
📌 TTY mode in the context of `sudo` refers to the requirement that the `sudo` command must be run from a real terminal (TTY or teletype terminal). When `requiretty` is set as a default in the `sudoers` file, it means that `sudo` can only be used from a login session that is directly connected to a physical terminal or from a remote session like SSH.

It ensures that the person invoking `sudo` has a real terminal session, which can help prevent unauthorized automated `sudo` executions.

</aside>

<aside>
📌 The `secure_path` setting in the `sudoers` file defines a secure PATH environment variable that is set when `sudo` is executed. This is a safety feature to ensure that when users execute commands using `sudo`, the system uses a known, secure set of directories to find the executables. The specific paths listed are standard locations where system and third-party executables are located.

</aside>

To save the changes, you need to press `Ctrl + O` (to record the changes), then `Enter` (to confirm the file name), and `Ctrl + X` (to exit the editor).

Then `exit` root session and `exit` again to return to login prompt. Log in again as user. Let's check if this user has sudo privileges:

```bash
sudo whoami
```

It should answer `root`.

Check logs:

```bash
sudo ls -lt /var/log/sudo
sudo cat /var/log/sudo/sudo.log
```

## **Step 2 - UFW**

A firewall is a critical component of network security. It controls incoming and outgoing network traffic based on predefined rules, acting as a barrier between a secure internal network and potentially unsafe external networks.

In this project, you will configure your operating system with the **Uncomplicated Firewall** (**UFW**), an easy-to-use interface for managing a netfilter firewall, to only allow traffic through port 4242.

```bash
# install UFW
sudo apt install ufw

# allow incoming connections on port 4242
sudo ufw allow 4242

# enable UFW to start on boot and activate the firewall rules
sudo ufw enable

# reload UFW to apply any changes made to the rules
sudo ufw reload

# display the status of UFW
sudo ufw status
```

Your UFW status should look like this - port 4242 is allowed for both IPv4 and IPv6 traffic. 

![Untitled](img/Untitled%2018.png)

## Step 3 - SSH

![Untitled](img/Untitled%2019.png)

**SSH (Secure Shell)** is a protocol for securely accessing and managing a server over an insecure network. It's essential for tasks like remote server administration, command execution, and file transfers. SSH's encryption ensures that sensitive data is protected during transmission.

Linux and macOS users can access SSH directly from their terminals, whereas Windows users may use tools like [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) or Windows Subsystem for Linux (WSL).

To safeguard your SSH connection from vulnerabilities, it's crucial to adopt secure practices such as disabling root login and enforcing strong authentication measures.

OpenSSH is the suite of tools for SSH protocols, providing encrypted communication over networks.

Here's how to install and configure OpenSSH on Debian for a secure connection:

### 1. Install OpenSSH

```bash
# update package lists
sudo apt-get update

# install the OpenSSH server
sudo apt-get install openssh-server

# check the SSH service status
sudo systemctl status ssh
```

The `active (running)` status indicates the server is operational. The `Server listening on` line shows the active SSH port.

![Untitled](img/Untitled%2020.png)

### 2. Edit configuration file

By default, OpenSSH uses port 22. Changing the default port to 4242 can enhance security by reducing the risk of automated attacks. 

Additionally, we'll disable root user login via SSH to prevent unauthorized administrative access.

```bash
sudo nano /etc/ssh/sshd_config
```

In the file, change the port number by modifying the `Port` line:

- Change `#Port 22` to `Port 4242`
- Change `#PermitRootLogin prohibit-password` to `PermitRootLogin no`

![Untitled](img/Untitled%2021.png)

After you have specified the port, press `Ctrl + O` and `Enter` to save the changes. Then press `Ctrl + X` to close the text editor.

To apply the changes, restart the SSH server.

```bash
sudo systemctl restart sshd
sudo systemctl status ssh
```

Here's the `systemctl` output confirming SSH is listening on port 4242:

![Untitled](img/Untitled%2022.png)

### 3. Connect to Network

Using **NAT (Network Address Translation)** in VirtualBox is typically the simplest way to connect virtual machines to the Internet without complex network configurations. It allows your virtual machine to share the host computer's IP address while keeping the VM shielded from direct exposure to the outside network.

<aside>
📌 Note for École 42 Paris Students:

If you encounter an error following other guides, it's a quirky feature of the École 42 Paris network setup.

![Untitled](img/Untitled%2023.png)

If running

```
ssh -p 4242 -vvv your_username@localhost
```

returns an HTML response, it signifies that a web server is occupying port 4242 on the host machine (your physical computer at the school).

</aside>

Accessing `localhost:4242` in a web browser and seeing a response indicates that this port is in use on the host machine.

![Untitled](img/Untitled%2024.png)

To resolve this port conflict and direct SSH connections appropriately, we need to modify the host port forwarding to a different, unused port.

Here's how to do it:

- Safely shutdown your server with:
    
    ```bash
    sudo shutdown now 
    ```
    
- Open VirtualBox and access your VM's `Settings`.
- Navigate to `Network` > `Adapter 1` > `Advanced` > `Port Forwarding`.
    
    ![Untitled](img/Untitled%2025.png)
    
- Modify the existing rule or add a new one. Change the `Host Port` to an available port, such as 4243, while retaining the `Guest Port` as 4242.
    
    ![Untitled](img/Untitled%2026.png)
    

After restarting your virtual machine, connect via SSH by typing in the terminal:

```bash
ssh your_username@localhost -p 4243
```

In case an error occurs, then type `rm ~/.ssh/known_hosts` in your iTerm and then retype `ssh your_username@127.0.0.1 -p 4243`

Type `exit` to close the SSH connection when done.

- **Connecting from Windows using PuTTY**
    - Launch the PuTTY application on your Windows system.
    - In the "Host Name (or IP address)" field, enter the IP address of your VM. Use `127.0.0.1` or `localhost` if you're using NAT with port forwarding on your local machine.
    - In the "Port" field, enter `4242`.
    - Make sure "SSH" is selected as the Connection type. Click "Open" to initiate the connection.
        
        ![Untitled](img/Untitled%2027.png)
        
    - When the terminal window opens, enter your VM's username and, when prompted, the password to log in.

### 4. Failed to send host log message

The error message that appears at VM boot, "[drm:vmw_host_log [vmwgfx]] *ERROR* Failed to send host log message" can easily be fixed. It is a graphics controller error. All we have to do is:

- Shut down VM
- In VirtualBox, go to VM settings
- `Display` >> `Screen` >> `Graphics Controller` >> Choose `VBoxVGA`.

## Step 4 - Password Policy

Setting up a strong password policy on a Linux system typically involves configuring the Pluggable Authentication Module (PAM) and the password aging policy.

> Project requirements:
> 
> - Your password has to expire every 30 days.
> - The minimum number of days allowed before the modification of a password will
> be set to 2.
> - The user has to receive a warning message 7 days before their password expires.
> - Your password must be at least 10 characters long. It must contain an uppercase letter, a lowercase letter, and a number. Also, it must not contain more than 3 consecutive identical characters.
> - The password must not include the name of the user.
> - The following rule does not apply to the root password: The password must have
> at least 7 characters that are not part of the former password.
> - Of course, your root password has to comply with this policy.
1. **Password Expiration and Warning Setup:**

Edit the `/etc/login.defs` file to set the password aging controls.

```bash
sudo nano /etc/login.defs
```

Look for the following lines and modify them accordingly:

```bash
PASS_MAX_DAYS   30
PASS_MIN_DAYS   2
PASS_WARN_AGE   7
```

This sets the maximum number of days a password remains valid (30 days), the minimum number of days before a password may be changed (2 days), and the number of days before the password is to expire that the user is warned (7 days).

Change the root and user passwords with the `passwd` command and ensure they meet the specified complexity:

```bash
sudo passwd root
sudo passwd usrname
```

Here's how you can update the password expiration for an existing users (root and your_user):

```bash
sudo chage -M 30 -m 2 -W 7 username
```

To check the current aging information for a user, you can use:

```bash
sudo chage -l username
```

In my server, I used:

- For **root**: `Dost0ev3Bes1`.
- For **user**: `Sh0rtPar1s`.
1. **Complexity Requirements:**

The Linux **Pluggable Authentication Modules (PAM)** library suite provides a Linux system administrator with techniques for authenticating users. This tool distributes authentication functions across four different management groups, including a password management group, as well as the account, authentication, and session groups.

The **Password Management Group** within PAM is responsible for enforcing password policies. This group can apply rules regarding password complexity, history, and expiration. When a user creates or changes their password, PAM modules associated with this group are invoked to ensure that the password adheres to the defined security policies.

The `pam_pwquality` module, part of this group, checks the strength of passwords against a set of rules defined in its configuration. These rules are designed to prevent the use of weak passwords that could compromise system security.

Ensure the `pam_pwquality` module is installed. It's usually installed by default, but if not, you can install it using:

```bash
sudo apt-get install libpam-pwquality
```

Then, configure PAM to enforce password complexity. Edit the PAM password configuration file:

```bash
sudo nano /etc/pam.d/common-password
```

Add or modify the line for `pam_pwquality.so` to include the required conditions:

```ruby
password requisite pam_pwquality.so retry=3 minlen=10 difok=7 maxrepeat=3 ucredit=-1 lcredit=-1 dcredit=-1 reject_username enforce_for_root
```

This is how the file must look:

![Untitled](img/Untitled%2033.png)

The parameters mean:

- `retry=3` — number of retries if the password fails to meet the policy.
- `minlen=10` — minimum acceptable size for the new password.
- `difok=7` — number of characters in the new password that must not be present in the old password. Even with enforce_for_root, this rule doesn't apply to the root user since the old password is not required to change it.
- `maxrepeat=3` — maximum of three consecutive identical characters.
- `ucredit=-1` — at least one uppercase character.
- `lcredit=-1` — at least one lowercase character.
- `dcredit=-1` — impose at most *n* digits when positive, and at least *n* digits when negative
- `reject_username` — check if the password contains the user's name.
- `enforce_for_root` — apply the same rules for the root user.
1. **Test the Password Policy:**

To test if the policy is in effect, try changing a user's password or the root password to see if the system enforces the new rules.

## Step 5 - Bash Script

For server monitoring purposes, it's required to have a script that will display crucial server status information to all terminals every 10 minutes, starting at server boot.

> The script must consistently provide the following data:
> 
> - Operating system architecture and kernel version.
> - Number of physical processors.
> - Number of virtual processors.
> - Current available RAM on your server and its usage percentage.
> - Current available disk memory on the server and its usage percentage.
> - Current CPU utilization percentage.
> - Date and time of the last reboot.
> - Active LVM status.
> - Number of active connections.
> - Number of logged-in users.
> - Server's IPv4 address and its MAC (Media Access Control) address.
> - Count of commands executed with the sudo program.

To broadcast the script output as required, we will utilize the **`wall`** command, which sends a message to all logged-in users across all terminals. By default, **`wall`** displays the message with a header, which is optional for this project.

For system-wide access, let's create a file in the directory **`/usr/local/bin/`**. To transfer the content, we'll access the server via the terminal.

```bash
# navigate to the directory
cd /usr/local/bin/

# create the script file
sudo touch monitoring.sh

# make the script executable
sudo chmod +x monitoring.sh

# open the script file to insert the code
sudo nano /usr/local/bin/monitoring.sh
```

Insert the following code:

```bash
#!/bin/bash

arch=$(uname -a)
pcpu=$(grep -c "physical id" /proc/cpuinfo)
vcpu=$(grep -c "processor" /proc/cpuinfo)
ram=$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')
total_disk=$(df -h --total | grep total | awk '{print $2}')
used_disk=$(df -h --total | grep total | awk '{print $3}')
av_disk=$(df -k --total | grep total | awk '{print $5}')
cpu_load=$(top -bn1 | grep '^%Cpu(s)' | awk '{printf("%.1f%%\n", $2+$4)}')
last_boot=$(who -b | awk '$1=="system" {print $3 " " $4}')
lvm=$(lsblk | grep "lvm" | wc -l)
lvm=$(if [ $lvm_use -eq 0 ]; then echo no; else echo yes; fi)
tcp=$(ss -t | grep ESTAB | wc -l)
user_log=$(who | wc -l)
ip_address=$(hostname -I | awk '{print $1}')
mac_address=$(ip link show | awk '/ether/ {print $2}')
sudo_cmd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

message="
       ------------------------------------------------
       Architecture    : $arch
       ------------------------------------------------
       Physical CPUs   : $pcpu
       Virtual CPUs    : $vcpu
       Memory Usage    : $ram
       Disk Usage      : $used_disk/${total_disk} ($av_disk)
       CPU Load        : $cpu_load
       ------------------------------------------------
       Last Boot       : $last_boot
       LVM use         : $lvm
       ------------------------------------------------
       TCP Connections : $tcp ESTABLISHED
       Users logged    : $user_log
       Network         : IP $ip_address ($mac_address)
       Sudo            : $sudo_cmd commands used
       ------------------------------------------------"

echo "$message" | wall
```

- Script Explanation
    
    Making the file executable allows the operating system to run the file as a program without specifying an interpreter explicitly (in this case, Bash). By making the file executable, you're informing the system that it contains code that can be directly executed as a regular program.
    
    The script gathers system information and displays it across all terminals using the **`wall`** command. The results from executing all commands are stored in variables, and the constructed message is then broadcasted using **`echo "$message" | wall`**.
    
    Let's examine in detail how the system information is collected:
    
    1. Architecture **`architecture=$(uname -a)`**
        - **`uname -a`**: **`uname`** command with the **`-a`** flag prints all available system information, including kernel name, version, processor architecture, and more. The result is stored in the **`architecture`** variable.
    2. CPU physical **`cpu_physical=$(grep -c "physical id" /proc/cpuinfo)`**
        - **`/proc/cpuinfo`** contains detailed information about the system's processors.
        - **`grep -c "physical id"`**: **`grep`** command searches for lines containing "physical id," and the **`-c`** flag counts the number of such lines, which corresponds to the number of physical processors.
    3. vCPU **`vcpu=$(grep -c "processor" /proc/cpuinfo)`**
        - similarly, **`grep -c "processor"`** in **`/proc/cpuinfo`** counts the number of virtual processors (cores).
    4. Memory Usage **`ram_usage=$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')`**
        - **`free -m`**: **`free`** command displays memory information in megabytes.
        - **`awk 'NR==2{...}'`**: **`awk`** processes the second line of output (**`NR==2`**), which contains data about physical memory. **`$3`** and **`$2`** represent used and total memory, respectively, and the percentage of usage is calculated from them.
    5. Disk Usage **`used_disk=$(df -h --total | grep total | awk '{print $3}')`**
        - **`df -h --total`**: the **`df`** command with the **`-h`** flag for human-readable format and **`--total`** to display a total line.
        - **`grep total`**: filters the total line which contains the aggregate disk usage values.
        - **`awk '{print $3}'`**: extracts the third field of the total line which represents the total used disk space.
    6. CPU load **`cpu_load=$(top -bn1 | grep '^%Cpu(s)' | awk '{printf("%.1f%%\n", $2+$4)}’)`**
        - **`top -bn1`**: the **`top`** command with the **`-bn1`** flags outputs the current system resource usage statistics in batch mode without delay, convenient for scripting.
        - **`grep '^%Cpu(s)'`**: filters the line that contains the current CPU usage information.
        - **`awk '{printf("%.1f%%\n", $2+$4)}'`**: processes the filtered output, summing up the percentage of CPU usage by user processes (field **`$2`**) and system processes (field **`$4`**). The result is formatted to display one decimal place and the percent sign.
    7. Last boot **`last_boot=$(who -b | awk '$1=="system" {print $3 " " $4}')`**
        - **`who -b`**: **`who`** with the **`-b`** flag shows the time of the last system boot.
        - **`awk '$1=="system" {...}'`**: **`awk`** processes this line to extract the date and time of the last boot.
    8. LVM use **`lvm_use=$(lsblk | grep "lvm" | wc -l)`**
        - **`lsblk`**: the command lists all block devices.
        - **`grep "lvm"`**: searches for lines containing "lvm", which indicates the presence of Logical Volume Management volumes.
        - **`wc -l`**: counts the number of such lines.
        - the subsequent check **`if [ $lvm_use -eq 0 ]`** determines if LVM is in use (yes/no).
    9. Connections TCP **`tcp=$(ss -t | grep ESTAB | wc -l)`**
        - **`ss -t`**: **`ss`** with the **`-t`** option displays active TCP connections.
        - **`grep ESTAB`**: **`grep`** filters the list to only show established connections.
        - **`wc -l`**: counts the number of established connections.
    10. User log **`user_log=$(who | wc -l)`**
        - **`who`**: displays information about users currently logged in.
        - **`wc -l`**: counts the number of logged-in users.
    11. Network IP adress **`ip_address=$(hostname -I | awk '{print $1}')`**
        - **`hostname -I`**: outputs all IP addresses associated with the host.
        - **`awk '{print $1}'`**: selects the first IP address from the list.
    12. Network MAC adress **`mac_address=$(ip link show | awk '/ether/ {print $2}')`**
        - **`ip link show`**: displays information about all network interfaces.
        - **`awk '/ether/ {print $2}'`**: searches for lines containing "ether" (the MAC address) and prints out the MAC address.
    13. Sudo **`sudo_cmd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)`**
        - **`journalctl _COMM=sudo`**: retrieves all log entries associated with the use of the **`sudo`** command.
        - **`grep COMMAND`**: selects lines containing "COMMAND", which indicates execution of a command through **`sudo`**.
        - **`wc -l`**: counts the number of such commands.
    
    Each of these commands performs its unique function to gather specific information about the system, and the results are stored in corresponding variables for subsequent use.
    

After you save the file, you can test the script by invoking it through the server's terminal:

```bash
./monitoring.sh
```

**Cron** is a time-based job scheduler in Unix-like computer operating systems. It enables users to schedule jobs (commands or scripts) to run periodically at fixed times, dates, or intervals.

**Crontab**: This is the file where the user's cron jobs are stored. Each user on the system can have their own crontab, and system jobs are typically located in **`/etc/crontab`** or a directory such as **`/etc/cron.d/`**. To view your current user's crontab entries, you can use the command **`crontab -l`**.

Cron is present on Debian by default. To check its version or even, by some reason, eventually install it, use:

```bash
apt install cron

# make sure it is running at startup
systemctl enable cron
```

To add a cron job, edit the crontab file as root:

```bash
sudo crontab -u root -e
```

At the end of the crontab, type the following `*/10 * * * * /usr/local/bin/monitoring.sh` this means that every 10 mins, this script will show.

## Step 6 - Hash Signature

SHA1 hash signature of your virtual machine's disk file (**`.vdi`** for VirtualBox) is a form of checksum that is unique to the specific state of the virtual disk at a given time. If any data within the disk file changes, the SHA1 signature will also change, thus this can be used to verify the integrity or identify changes to the disk.

Last step in project is generating the hash of your .vdi file. This ensures that your virtual machine remains unchanged between the project's closure and subsequent evaluations.

First, shut down your guest machine and **take a snapshot** of it in Virtualbox. This step enables you to revert to the exact state captured in the snapshot at any time, regardless of any significant changes made to your system thereafter. Be sure to use this snapshot before each evaluation.

Navigate to the directory containing your virtual machine.

Then use the following command (replace D`ebian` with your machine name):

- Windows: `certUtil -hashfile debian.vdi sha1`
- Linux: `sha1sum Debian.vdi`
- MacOS: `shasum debian.vdi`

Be aware that this process might take a long time. The larger your virtual disk size, the longer it will take to generate the hash signature.

And save the signature to a file named `signature.txt`.
