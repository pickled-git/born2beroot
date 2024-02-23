# Born2beRoot

- System Administration
- Virtualization
- Linux

**Project goal:** To set up a personal server by creating a virtual machine and implementing strict guidelines for system administration and security.

# **Understanding Virtual Machines**

## **How Virtual Machines Work**

A **Virtual machine** (VM) is a software emulation of a physical computer, acting like a real computer that runs its own operating system and applications, just like a physical computer would.

**Virtualization** involves creating software-based versions of physical components, such as servers, desktops, storage devices, and network resources. These virtual resources utilize dedicated amounts of CPU, memory, and storage from a physical host. A **hypervisor**, also known as a virtual machine monitor (VMM), is the software that creates and runs VMs. It abstracts the host's physical hardware resources and allocates them to VMs, treating these resources as a pool that can be shared among existing VMs or allocated to new ones. 

The physical machine that runs the hypervisor is called the host machine, or simply the host, while the VMs that utilize its resources are known as guest machines, or guests. The hypervisor ensures that each guest machine operates independently and is isolated from others, providing secure and efficient management of multiple operating systems on a single physical machine.

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled.png)

In Born2beRoot project, [**Oracle VM VirtualBox](https://en.wikipedia.org/wiki/VirtualBox)** is recommended for creating and managing VMs. ****It's an open-source hosted hypervisor that you will find on your computer at a 42 School. Otherwise you can [install it](https://www.virtualbox.org/manual/ch02.html). It is an example of Type 2 or hosted hypervisor that works by running on top of the host's existing operating system (OS) just like any regular application would.

There are also Type 1 or bare metal hypervisors, which run directly on the host's hardware to control the hardware and manage guest operating systems.

## Operating System**s on Virtual Machines**

An **Operating System** (OS) is a crucial piece of software that controls the computer's hardware and software resources and provides general services for computer applications. In other words, it is the bridge between the user, the programs, and the hardware of the computer.

You can set up an operating system on virtual machines with an ISO image file. This file can be added in the VM settings, working like a real install disk.

When setting up a VM for the Born2beRoot project, you have the option to choose between Debian or Rocky. Both are open-source, free to use, and highly regarded for their stability and security, making them excellent choices for server use.

### Debian vs **Rocky** OS

![raw.jpg](Born2beRoot%20512b46befde34df19fee06231fd38903/raw.jpg)

**Debian** has a rich history dating back to the 1990s, with a strong commitment to the principles of free software. It's developed and maintained by a huge community, ensuring a stable and widely compatible operating system. Debian includes the Advanced Packaging Tool (APT) for easy software management, making it accessible for newcomers and skilled administrators alike.

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%201.png)

**Rocky Linux** is a new member of the Linux family, designed to work in a similar way to Red Hat Enterprise Linux, a version of Linux developed specifically for businesses and enterprises. However, you don't need to have a subscription to use Rocky Linux. This makes it an excellent choice for users seeking an OS that aligns with enterprise standards but prefer a community-supported model.

In the Born2beRoot project, you'll dive into system administration by installing and configuring one of these operating systems on a VM. You'll practice partitioning, managing users, and improving security, which are all key skills for a system administrator.

Utilizing VMs for this project allows for a safe, flexible learning environment. You can experiment with different settings and configurations without risking a physical system, making it an ideal setup for education and exploration.

If you are a beginner, 42 recommends that you use Debian.

<aside>
📌 I picked Debian for my Born2beRoot project because it's easy to use and has strong community support.

</aside>

## **Why use a Virtual Machine**

Using a virtual machine is a smart choice for many reasons. It's like having several computers inside your main one, which saves money and space.

When a physical server crashes, it can be complex to recover the data it contained. The software aspect of VMs simplifies data backup. While your VM is running, it is possible to obtain a backup thanks to a snapshot of the VM and its data. In case of an incident, this snapshot allows you to restore the VM to its previous state.

VMs are also great for keeping your computer safe from viruses. Since each VM is separate from the others and from your main computer, a virus in one VM won't spread to the rest. This means you can try new things or open risky files in a VM without worrying about harming your main computer.

People use VMs for all sorts of things. Developers test new apps on VMs to make sure they work right without messing up their main computer. Students and teachers use VMs to learn about different software and computer setups safely. You can even use VMs to run old games or programs that don't work on new computers anymore.

**In summary**, virtual machines offer a flexible, efficient, and secure way to manage computing resources, making them an invaluable tool in software development, education, IT management, and personal computing. With virtual machines, you can do more with your computer without the risk of breaking anything.

# **Installation**

To begin, [download](https://www.debian.org/download.en.html) the latest version of the Debian ISO and place it in your */sgoinfre/goinfre/Perso/your_login* folder.

<aside>
📌 By placing your virtual machine on the *sgoinfre* server, you gain the flexibility to switch computers throughout your project. However, if you use the local *goinfre* folder, you must remain on the same computer for all your work.

</aside>

## Step 1 - Install your **Virtual Machine**

Decide if you will complete the Born2beRoot project with bonuses, as this affects the virtual hard disk size from the very beginning.

<aside>
📌 I intend to complete only the first bonus and perform disk partitioning.

</aside>

1. Open VirtualBox and click 'New'.
2. Name your machine and set `/sgoinfre/goinfre/Perso/your_login` as the Machine folder. Select 'Linux' and 'Debian 64-bit' as the type and version, respectively.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%202.png)
    
3. Allocate `1024MB` of memory, which should suffice.
4. Create a virtual hard disk now.
5. `VDI`(VirtualBox Disk Image) because we plan to use the VM only within VirtualBox.
6. Opt for `Dynamically allocated`, which will use physical machine memory as needed up to the set limit.
7. Allocate `30.8 GB` for the virtual hard disk to have enough space for the bonus part.

## **Step 2 - Installing Debian**

1. Assign the Debian ISO image as the startup disk by navigating to ‘Settings’ > ‘Storage’ > ‘Controller: IDE’ on the VirtualBox interface. Under ‘Attributes’, click on the disk icon next to ‘Optical Drive’ and select ‘Choose a disk file’. Locate and select the Debian ISO you downloaded.
2. Click `Start` to boot up your Virtual Machine.
3. Upon the Debian startup screen, select `Install` for a non-graphical installation process.
4. Choose language, geographical & keyboard layout settings. (My ex. `English` , `France` , `United States en_US.UTF-8` , `American English`)
5. Hostname must be `your_login42` – replacing ‘your_login’ with your actual login ID.
6. Leave the domain name field blank.
7. Create a password for the root account and confirm it (you may initially set a simple password, as you will be required to change it later during the configuration of your password policy).
8. Proceed to create a new user account. The username must be your login ID and you can enter the same or a different name for the full name of the user.
9. Set and confirm a password for the new user account.

The **root user** is the superuser account in Unix and Linux systems. It has the highest level of access to the system and can perform all administrative tasks. The root user can add or remove other users, modify their privileges, and has unrestricted access to all files and commands.

A **hostname** is a unique name assigned to a device, such as a computer or server, on a network. It identifies the machine within electronic networks. It can be any name that helps you easily recognize your server among other machines on a network or the internet. In the Born2beRoot project, you'll need to set a hostname according to specific requirements, usually your system login followed by '42', for example, user42.

## Step 3 - Disk **Partitioning**

![DALL·E 2024-02-12 00.36.12 - Illustration for a Linux lecture note focused on disk partitioning, featuring a stylized representation of a hard drive divided into multiple sections.webp](Born2beRoot%20512b46befde34df19fee06231fd38903/DALLE_2024-02-12_00.36.12_-_Illustration_for_a_Linux_lecture_note_focused_on_disk_partitioning_featuring_a_stylized_representation_of_a_hard_drive_divided_into_multiple_sections.webp)

**Disk partitioning** is the creation of one or more storage regions (called *partitions*) on a hard drive, so that each region can be managed separately.

Unlike Windows, which often operates with a single partition, Linux systems benefit from the flexibility of multiple partitions. If something happens to corrupt the file system, generally only one partition is affected and you can still boot into GNU/Linux to fix the system.

**Key Partitions in Our Project:**

| /boot | Contains bootloader files like GRUB (which manages the boot process), kernel images (the core of the Linux operating system), and initrd (a temporary file system used during boot). It's crucial for the system's startup process |
| --- | --- |
| /(root) | The main partition holding system files, with other partitions mounted under it. It's the backbone of the Linux file system hierarchy |
| swap | Acts as overflow space for RAM, providing virtual memory when physical RAM is full, which is essential for system stability and performance |
| /home | Dedicated to storing user files and settings, the /home partition is vital for personal data backup. Keeping it separate from the system partitions facilitates easier and safer data management |
| /var | Stores variable data like logs, emails, websites, and databases, which can grow over time. Isolating /var helps prevent system issues due to unexpected increases in data volume |
| /srv | Intended for site-specific data served by the system, such as web pages and FTP files. Separating this data into its own partition maintains a clear distinction from operating system and user data |
| /tmp | Used for temporary files created by programs and users. Data here is typically deleted upon reboot or after a set period |
| /var/log | A sub-directory within /var dedicated to log files from various system and application services. It's a good practice to isolate log files to manage their growth and impact on the system |

It's common to allocate partitions for services that can generate significant data volumes to prevent system partition saturation. **Encrypting** sensitive partitions, such as /home, /var, and /srv, enhances data security by making the data unreadable without the correct decryption key. 

Predicting future storage needs can be challenging. If a partition is too small, it may require system reinstallation or constant data management to free up space. **Logical Volume Manager (LVM)** addresses this issue by allowing "dynamic partitions," which can be resized, created, or deleted on-the-fly without system reboots.

**Ext4**, standing for the Fourth Extended Filesystem, is a widely-used journaling filesystem in Linux, developed as the successor to ext3. Furthermore, ext4 is the default file system for many Linux distributions including Debian and Ubuntu. By using Ext4, we ensure that our system is built on a solid foundation, capable of handling a wide range of storage tasks with ease.

### **Manual partition**

1. When choosing disk partitioning, we will select `Manual`. This way we can edit the partitions one by one.
2. In this section, it shows us a general description of our partitions and mount points. Currently, we do not have any partitions. To create a new partition table, we must choose the device where we want to create them. In our case, we will choose the only one available.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%203.png)
    
3. We accept the confirmation message. Basically, it warns us that if there are already partitions on the device, they will be deleted and that if we are sure to create a new empty partition table.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%204.png)
    
4. Once we have completed the previous step, we can see how our partition table appears empty. Now we must configure it.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%205.png)
    
5. `Create a new partition` .
6. `525m`. 

<aside>
📌 The **`lsblk`** command reports storage sizes in binary units (GibiBytes and MebiBytes), often used by operating systems when they report file sizes and disk capacity. That why, and due to filesystem metadata overhead I add more Megabytes here to match the picture from the project’s subject.

1 MebiByte (MiB) **≈** 2^20 (1,048,576) bytes.

</aside>

1. Choose `Primary` because it will be the partition where the Operating System will be installed.
2. Select `Beginning` because we want the new partition to be created at the beginning of the available space.
3. Choose `/boot` as the `Mount point` for our partition.
4. `Done setting up the partition`.
5. Now we must create a logical partition with all the available space on the disk, which has no mount point and is encrypted. To do this, we select the free space where we want to create it.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%206.png)
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%207.png)
    
6. `Create a new partition` .
7. `max`.
8. `Logical`.
9. Choose `Do not mount it` as `Mount point`.
10. `Done setting up the partition`.
11. `Configure encrypted volumes`. This way we can encrypt our partition.
12. `Yes`.
13. `Create encrypted volumes`.
14. Select which partition we want to encrypt (Spacebar).
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%208.png)
    
15. `Done setting up the partition`.
16. We `Finish` because we don't want to create more encrypted volumes.
17. `Yes`.
18. `Cancel` it because there is nothing to encrypt since the partition is empty.
19. Enter encryption phrase.
20. `Configure the Logical Volume Manager`.
21. `Yes`.
22. `Create volume group`.
23. Enter the name `LVMGroup` as indicated in the subject.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%209.png)
    
24. Select the partition where we want to create the group.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2010.png)
    
25. Now we must create all the logical partitions.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2011.png)
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2012.png)
    
26. Choose the only one group where we want them to be created - `LVMGroup`.
27. The order of creation of the logical units will be the same as indicated in the subject, so we will start with `root` and end with var-log. 
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2013.png)
    
28. `10,737,418,240b`.

<aside>
📌 I set partition sizes in bytes to be as close as possible to the project’s subject.

</aside>

1. `Create logical volume`>`LVMGroup`>`swap`>`2,469,606,195.2b`.
2. `Create logical volume`>`LVMGroup`>`home`>`5,368,709,120b`.
3. `Create logical volume`>`LVMGroup`>`var`>`3,221,225,472b`.
4. `Create logical volume`>`LVMGroup`>`srv`>`3,221,225,472b`.
5. `Create logical volume`>`LVMGroup`>`tmp`>`3,221,225,472b`.
6. `Create logical volume`>`LVMGroup`>`var-log`>`4290MB` (the remainder will be displayed automatically).

<aside>
📌 LVM uses a hyphen to separate the volume group and the logical volume, so if one of the two contains a hyphen, it gets converted to two hyphens.
Example: if we have a volume group named LVM and a logical volume named var-log, we would end up with the name of the logical volume written as the following: LVM-var--log.

</aside>

1. `Finish` the configuration of the logical volume manager.
2. Now we must configure all the logical partitions to the file system that we want and the mount point indicated in the subject. Again we will go in order and select the first one that appears, which is `home`.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2014.png)
    
3. We must choose a file system as it currently does not have one. `Use as:` `Ext4` file system, it is the most commonly used file system in Linux distributions. `Mount point` > `/home` > `Done`.
4. "LV root", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `/` > `Done`.
5. "LV srv", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `/srv` > `Done`.
6. For `swap`, we will make an exception because the file system will be different. "LV swap", `#1 xxGB` > `Use as` > `swap ares` >`Done`.
7. "LV tmp", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `/tmp` > `Done`.
8. "LV var", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `/var` > `Done`.
9. "LV var-log", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `Enter manually` >`/var/log` > `Done`.
10. `Finish partitioning`.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2015.png)
    
11. Accept the message and make sure that all of the partitions look the same as in the screenshot.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2016.png)
    
12. `No` because we do not need additional packages.
13. `France`.
14. `deb.debian.org`.
15. Leave proxy field `blank`.
16. `No` because we do not want developers to see our statistics even though they are anonymous.
17. Uncheck all software and press `Continue`.
18. `Yes` to install GRUB boot on the hard drive. `/dev/sda (ata_VBOX_HARDDISK)`.
19. After completing the Debian installation, click `Continue` to reboot the system.

Upon clicking `Continue` after the installation, your VirtualBox should automatically eject the Debian ISO image. This ensures that your virtual machine will boot from the newly installed system rather than the installation media on the next startup.

## **Step 4 - Finish Installation**

After rebooting, you can log in to your Debian system and check the disk partitions to confirm they align with the project's specifications.

1. Press enter on `Debian GNU/Linux`.
2. When prompted, enter the encryption password you set during the installation.
3. Log in with the username you created previously.
4. Type `lsblk` in your Virtual Machine to see the partition.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2017.png)
    
5. Type `head -n 2 /etc/os-release` to check OS version.

After successfully installing Debian and checking the disk partitioning, we will configure essential system settings according to the Born2beRoot project subject.

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

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2018.png)

## Step 3 - SSH

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2019.png)

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

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2020.png)

### 2. Edit configuration file

By default, OpenSSH uses port 22. Changing the default port to 4242 can enhance security by reducing the risk of automated attacks. 

Additionally, we'll disable root user login via SSH to prevent unauthorized administrative access.

```bash
sudo nano /etc/ssh/sshd_config
```

In the file, change the port number by modifying the `Port` line:

- Change `#Port 22` to `Port 4242`
- Change `#PermitRootLogin prohibit-password` to `PermitRootLogin no`

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2021.png)

After you have specified the port, press `Ctrl + O` and `Enter` to save the changes. Then press `Ctrl + X` to close the text editor.

To apply the changes, restart the SSH server.

```bash
sudo systemctl restart sshd
sudo systemctl status ssh
```

Here's the `systemctl` output confirming SSH is listening on port 4242:

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2022.png)

### 3. Connect to Network

Using **NAT (Network Address Translation)** in VirtualBox is typically the simplest way to connect virtual machines to the Internet without complex network configurations. It allows your virtual machine to share the host computer's IP address while keeping the VM shielded from direct exposure to the outside network.

<aside>
📌 **Note for École 42 Paris Students:**

If you encounter an error following other guides, it's a quirky feature of the École 42 Paris network setup.

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2023.png)

If running

```
ssh -p 4242 -vvv your_username@localhost
```

returns an HTML response, it signifies that a web server is occupying port 4242 on the host machine (your physical computer at the school).

</aside>

Accessing `localhost:4242` in a web browser and seeing a response indicates that this port is in use on the host machine.

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2024.png)

To resolve this port conflict and direct SSH connections appropriately, we need to modify the host port forwarding to a different, unused port.

Here's how to do it:

- Safely shutdown your server with:
    
    ```bash
    sudo shutdown now 
    ```
    
- Open VirtualBox and access your VM's `Settings`.
- Navigate to `Network` > `Adapter 1` > `Advanced` > `Port Forwarding`.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2025.png)
    
- Modify the existing rule or add a new one. Change the `Host Port` to an available port, such as 4243, while retaining the `Guest Port` as 4242.
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2026.png)
    

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
        
        ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2027.png)
        
    - When the terminal window opens, enter your VM's username and, when prompted, the password to log in.

### 4. Set up static IP (I lost SSH connection after doing that)

Some computer networks may identify your internet connection as a `socket`, which can be displayed when running network commands like `ss -tunlp`. This is seen in the example image below.

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2028.png)

The expected output for the `ss -tunlp` command, as per the project guidelines, should look like this:

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2029.png)

To ensure that SSH is the only service running on a designated socket, setting your machine's IP as **static** is recommended. This can help avoid port conflicts and ensure proper routing of network traffic. You'll need to install `net-tools` for essential network commands such as `ifconfig`. These tools allow you to gather information like your `network interface`, `IP address`, `netmask`, and `gateway`.

```bash
# install net-tools for network configuration utilities
sudo apt-get install net-tools

# display network interface configurations
sudo ifconfig -a
```

Note down the inet (should look like 192.168.x.xxx or 10.0.x.x) and netmask (usually 255.255.255.0). 

Open the kernel routing tables:

```bash
sudo route -n
```

Note down the default gateway on the line with the UG flag (192.168.x.xxx or 10.0.x.x). 

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2030.png)

Then open the network interfaces configuration file:

```bash
sudo nano /etc/network/interfaces
```

Edit this file from line 12, switch dhcp with static and input your informations, chose an IP between 192.168.1.1 to 192.168.1.255 or between 10.1.1.1 to 10.1.1.255.

For example :

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2031.png)

Press `Ctrl + O` and `Enter` to save the changes. Then press `Ctrl + X` to close the text editor.

Now restart the virtual machine to check that the informations have changed in ifconfig.

```bash
# list the sockets available again
sudo ss -tunlp
```

The UDP line should have disappeared.

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2032.png)

## Failed to send host log message

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

![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2033.png)

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

# **Evaluation**

- **Correction sheet**
    
    https://docs.google.com/document/d/1-BwCO0udUP7MhRh81Y681zz0BalXtKFtte_FHJc6G4s/edit?pli=1
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2034.png)
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2035.png)
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2036.png)
    
    ![Untitled](Born2beRoot%20512b46befde34df19fee06231fd38903/Untitled%2037.png)
    
- **Theory**
    1. **How does a virtual machine work ?**
        
        A **Virtual machine** (VM) is a software emulation of a physical computer, acting like a real computer that runs its own operating system and applications, just like a physical computer would.
        
        A **hypervisor**  is the software that creates and runs VMs. It abstracts the host's physical hardware resources and allocates them to VMs, treating these resources as a pool that can be shared among existing VMs or allocated to new ones. 
        
        Oracle VirtualBox is an example of hosted hypervisor that works by running on top of the host's existing operating system (OS). There are also bare metal hypervisors, which run directly on the host's hardware to control it and manage guest operating systems.
        
    2. **Choice of operating system.**
        
        I picked **Debian** for my Born2beRoot project because it's easy to use and has strong community support.
        
    3. **The basic differences between Debian and RockyOS ?**
        
        Both are open-source, free to use, and highly regarded for their stability and security, making them excellent choices for server use.
        
        Rocky Linux was released in 2021 while Debian has a rich history dating back to the 1990s.
        
        **Rocky Linux** designed to work in a similar way to Red Hat Enterprise Linux, a version of Linux developed specifically for businesses and enterprises. This means that users can easily migrate their applications and scripts from Rocky Linux without additional configuration or changes.
        
        While **Debian** is aimed at a wide audience and supports a variety of architectures.
        
        Debian is known for its stability and long-term release support policy, while RHEL-based systems, including Rocky Linux, offer commercial support and a guarantee of compatibility with corporate standards.
        
    4. **The purpose of virtual machines.**
        
        They save your money, because you can have several computers inside one. You can easily recover your data by making snapshots of your operational system. You can try new things or open risky files in a VM without worrying about harming your main computer. Students are using virtual machines in educational purposes. Or you can even run old games that don't work on new computers anymore.
        
    5. **The difference between aptitude and apt.**
        
        Debian based systems, by default, use `APT` (Advanced Package Tool) that is the most common and most used package manager. It comes installed by default and provides command-line management for all the packages you might need on your computer in a resonably user-friendly way, with shorter and more intuitive commands.
        
        **‘Aptitude’** provides a text-based user interface (TUI) for interactive package management, whereas **‘apt’** offers a command-line interface (CLI) for straightforward package management tasks.
        
        When facing a package conflict, ‘apt’ will not fix the issue while ‘aptitude’ will suggest a resolution that can do the job.
        
        ‘Aptitude’ can track automatically installed packages that are no longer needed (have no dependencies) and suggests removing them.
        
        And also ‘aptitude’ can find you the reason to install a certain package by looking in the list of installed packages.
        
    6. **What is APPArmor ?**
        
        **AppArmor** is an effective and easy-to-use Linux application security system. It prevents unauthorized actions, thereby limiting the damage from potential exploits.
        
         It operates on the principle of "least privilege," where each program is only given access to the files and capabilities it needs to operate, and nothing more. This reduces the risk of damage if an application is compromised. 
        
    7. **How you were able to set up the rules requested in the subject ?**
        
        By configuring the Pluggable Authentication Module (PAM) and the password aging policy. I edited the `/etc/login.defs` file to set the password aging controls. Then I installed the `pam_pwquality` module that checks the strength of passwords against a set of rules defined in its configuration. And edited password configuration file `/etc/pam.d/common-password`.
        
    8. Advantages and disadvantages of password policy and its implementation.
        
        **Adv:**
        
        - **Enhanced Security:** The policy increases the overall security of the system by enforcing the use of strong passwords, which are harder for attackers to guess or crack.
        - **Regular Updates:** Mandatory password changes every 30 days help protect against long-term undetected breaches, ensuring that even if a password is compromised, it will only be usable for a limited time.
        - **Enforced Complexity:** By requiring a mix of uppercase, lowercase, and numerical characters, and disallowing more than three consecutive identical characters, the policy ensures that passwords are complex and difficult to guess.
        
        **Disadv:**
        
        - **User Inconvenience:** Users may find frequent password changes inconvenient.
        - **Potential for Weaker Passwords:** To remember complex passwords that change frequently, users might resort to writing them down or using predictable patterns, which can ultimately weaken security.
        - **Administrative Overhead:** Enforcing and managing a strict password policy can lead to increased administrative work, such as assisting users with password resets and ensuring compliance.
        
        In terms of implementation, the use of the PAM module **`pam_pwquality.so`** makes it easier to enforce these rules technically, but it's important to ensure users are educated about how to create strong passwords that they can remember without writing them down or using simple patterns.
        
    9. **What's a partition ? And more generally how does LVM (Logical Volume Management) work ?**
        
        **Disk partitioning** is the creation of one or more storage regions (called *partitions*) on a hard drive, so that each region can be managed separately. If something happens to corrupt the file system, generally only one partition is affected and you can still boot into GNU/Linux to fix the system. It's like subdividing the total space of a hard drive into smaller, isolated sections, each of which can be managed independently.
        
        Logical Volume Management (LVM) is a more flexible method of managing disk storage space. Instead of being restricted by fixed-size partitions, LVM allows for the use of logical volumes that can be resized and moved easily. 
        
    10. **The value and operation of sudo.**
        
        `sudo` (short for "superuser do") is a command that allows users to run programs with the security privileges of the superuser or root. It provides a secure way of granting administrative access to users without sharing the root password. Different users can be given different levels of access.  Actions taken using **`sudo`** can be logged, which helps in auditing and tracking changes made to the system.
        
        **Operation of `sudo`:**
        
        Users prefixed with **`sudo`** execute commands with root or another user’s privileges, as defined in the **`/etc/sudoers`** file.
        
        The `/etc/sudoers` file is crucial for configuring `sudo`. It specifies which users or groups can run specific commands as superusers.
        
        The **`sudoers`** file should be edited with the **`visudo`** command, which locks the file against multiple simultaneous edits and performs a sanity check on the contents before saving it.
        
    11. **What is UFW and what's the value of using it ?**
        
        UFW, which stands for Uncomplicated Firewall, is a user-friendly interface for managing iptables (netfilter) firewall rules on Unix-like operating systems.
        
        A firewall is a critical component of network security. It controls incoming and outgoing network traffic based on predefined rules, acting as a barrier between a secure internal network and potentially unsafe external networks. 
        
         'Firewall', in turn, is a security device responsible for monitoring the information and data traffic from your local computer to the network.
        
        UFW allows you to create allow/deny rules based on simple parameters such as application name, port number, and IP address.
        
    12. **What's SSH and what's the value of using it ?**
        
        **Secure Socket Shell** is a network protocol that gives users, particularly system administrators, a secure way to access a computer over an unsecured network. It provides users with a strong password authentication as well as a public key authentication. It attempts to safely communicate encrypted data over two computers using an open network.
        
    13. **How the script works.**
    14. **What is “cron” ?**
        
        **Cron** is a time-based job scheduler. It enables users to schedule jobs (commands or scripts) to run periodically at fixed times, dates, or intervals.
        
- **Practice**
    - Check that the signature contained is identical to that of the ".vdi" file of the virtual machine to be evaluated.
        
        ```bash
        cat /mnt/nfs/homes/oprosvir/Documents/curric/B2B/signature.txt && sha1sum /mnt/nfs/homes/oprosvir/sgoinfre/goinfre/Perso/oprosvir/Debian/Debian.vdi
        ```
        
    - The machine should not have a graphical environment at launch.
    - A password is requested before attempting to connect to this machine.
    - You need to connect with an user. The user must not be root.
    - Check that the UFW service is started.
        
        ```bash
        sudo ufw status
        ```
        
    - Check that the SSH service is started.
        
        ```bash
        sudo systemctl status ssh
        ```
        
    - Check the operating system (or you can check it on the information script).
        
        ```bash
        head -n 2 /etc/os-release
        
        # or
        
        uname -v
        ```
        
    - Check that a user with your login exists and is present on your VM. This user should belong to the groups "sudo" and "user42".
        
        ```bash
        groups <username>
        ```
        
    - Create a new user for the evaluator. He/she chooses a password following the password policy.
        
        ```bash
        sudo adduser <new_username>
        ```
        
    - To check the current password aging information.
        
        ```bash
        sudo chage -l username
        sudo nano /etc/login.defs
        ```
        
    - To open PAM password configuration file.
        
        ```bash
        sudo nano /etc/pam.d/common-password
        ```
        
    - Create a new group named "evaluating": `sudo groupadd <groupname>`.
    - Assign it to your new user (the evaluator's user): `sudo usermod -aG <groupname> <username>`.
    - Check that this new user belongs to the "evaluating" group: `getent group evaluating` or `groups user_name` .
    - Check that the hostname of the machine is correctly formatted as follows: login42 `hostnamectl`.
    - Modify hostname to replace your login with the evaluator's. Then restart your virtual machine and restore the machine to the original name (just do the same thing under **root**).
    
    ```bash
    sudo hostnamectl set-hostname <new_hostname>
    
    # change the hostname in this file too
    sudo nano /etc/hosts
    ```
    
    - Check the partitions for your VM (compare the output with the example in the subject) - `lsblk`.
    - Check that the sudo program is properly installed on the virtual machine
        
        ```bash
        sudo --version | head -n 1
        ```
        
    - Assign the evaluator's username to the "sudo" group.
        
        ```bash
        sudo adduser name_user sudo
        ```
        
    - We check that it is within the group.
        
        ```bash
        getent group sudo
        ```
        
    - Show the application of the rules imposed for sudo by the subject.
        
        ```bash
        sudo visudo
        ```
        
    - Verify that the " /var/log/sudo/" folder exists and hast at least one file.
        
        ```bash
        # under root
        cd /var/log/sudo/
        ls -lt
        cat sudo.log
        ```
        
    - Try to run a command via sudo and see if the files above have been updated.
    - Check that the UFW program is installed on your VM and that is working properly `dpkg -l | grep ufw -`or `sudo ufw status`.
    - List the active rule in UFW. A rule must exist for port 4242 `sudo ufw status numbered`.
    - Add a new rule to open port 8080 `sudo ufw allow 8080`.
    - Check that it has been added to the active rules `sudo ufw status numbered`.
    - Delete this new added rule`sudo ufw delete <rule_number>`.
    - Check that the SSH service is installed and working on your virtual machine `sudo service ssh status`.
    - Use ssh to log in with the newly created user. Make sure that you cannot use ssh with the root user.
    - We connect via ssh with the new user using the command `ssh newuser@localhost -p 4243`.
    - Open your information script (the one that appears every 10 minutes) and explain it.
        
        ```bash
        cd /usr/local/bin/
        nano monitoring.sh
        ```
        
    - Modify the runtime of the script from 10 minutes to 1 `sudo crontab -u root -e`. We modify the first parameter, instead of 10 we change it to 1.
    - Finally, make the script stop running when the server has started, but without modifying the script. Just open crontab and put line under comment, then `reboot`.

# Links

[Основы виртуализации (обзор)](https://habr.com/ru/articles/657677/)

[НОУ ИНТУИТ | Операционная система UNIX | Информация](https://intuit.ru/studies/courses/22/22/info)

[Debian 10 Manual Partition for /boot, /swap, root, /home, /tmp, /srv, /var, /var/mail, /var/log](https://techencyclopedia.wordpress.com/2020/04/21/debian-10-manual-partition-for-boot-swap-root-home-tmp-srv-var-var-mail-var-log/)

[https://www.youtube.com/watch?v=wX75Z-4MEoM&t=726s](https://www.youtube.com/watch?v=wX75Z-4MEoM&t=726s)

[Разбивка диска для установки Linux - Losst](https://losst.pro/razbivka-diska-dlya-ustanovki-linux)

[https://github.com/ThePush/42_cursus/tree/master/Born2beroot](https://github.com/ThePush/42_cursus/tree/master/Born2beroot)

[https://codeberg.org/Vusk/Born2beroot-Tutorial/src/branch/main/Walkthrough-Born2BeRoot.md](https://codeberg.org/Vusk/Born2beroot-Tutorial/src/branch/main/Walkthrough-Born2BeRoot.md)

[https://baigal.medium.com/born2beroot-e6e26dfb50ac](https://baigal.medium.com/born2beroot-e6e26dfb50ac)

[https://github.com/pasqualerossi/Born2BeRoot-Guide?tab=readme-ov-file](https://github.com/pasqualerossi/Born2BeRoot-Guide?tab=readme-ov-file)

[Born2beRoot - Guide (gitbook.io)](https://42-cursus.gitbook.io/guide/rank-01/born2beroot)

[Born2beroot-Tutorial/README_EN.md at main · gemartin99/Born2beroot-Tutorial (github.com)](https://github.com/gemartin99/Born2beroot-Tutorial/blob/main/README_EN.md)

[Born2beroot/guide/configuration_debian.md at main · mcombeau/Born2beroot (github.com)](https://github.com/mcombeau/Born2beroot/blob/main/guide/configuration_debian.md)

[42sp-cursus-born2beroot/guides/Debian-en.md at master · caroldaniel/42sp-cursus-born2beroot (github.com)](https://github.com/caroldaniel/42sp-cursus-born2beroot/blob/master/guides/Debian-en.md)

[Born2beroot. 42 school project | by Baigalmaa Baatar | Medium](https://baigal.medium.com/born2beroot-e6e26dfb50ac)

[https://habr.com/ru/articles/655275/](https://habr.com/ru/articles/655275/)

[Коротко об SSH](https://habr.com/ru/sandbox/166705/)

[Как установить и настроить SSH-сервер на Debian](https://help.reg.ru/support/servery-vps/oblachnyye-servery/rabota-s-serverom/kak-ustanovit-i-nastroit-ssh-server-na-debian)

[10 Useful Sudoers Configurations for Setting 'sudo' in Linux](https://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/)

[Основы Linux (обзор с практическим уклоном)](https://habr.com/ru/articles/655275/)

[GitHub - chlimous/42-born2beroot_guide: 42 Born2beroot Ultimate Guide with Bonus](https://github.com/chlimous/42-born2beroot_guide?tab=readme-ov-file#setting-up-ssh)

[GitHub - Anisia-Klimenko/born2beroot_21school: Проект по изучению основ системного администрирования](https://github.com/Anisia-Klimenko/born2beroot_21school?trk=public_profile_project-button)

[Managing Password Complexity in Linux | Baeldung on Linux](https://www.baeldung.com/linux/password-complexity)

[](https://github.com/gemartin99/Born2beroot-Tutorial/blob/main/README_EN.md#4--virtual-machine-setup-️)

[Born2beroot](https://baigal.medium.com/born2beroot-e6e26dfb50ac)

[https://github.com/ThePush/42_cursus/tree/master/Born2beroot#Sudo-configuration](https://github.com/ThePush/42_cursus/tree/master/Born2beroot#Sudo-configuration)

[https://github.com/caroldaniel/42sp-cursus-born2beroot/blob/master/guides/Debian-en.md](https://github.com/caroldaniel/42sp-cursus-born2beroot/blob/master/guides/Debian-en.md)