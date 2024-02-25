# **Installation**

To begin, [download](https://www.debian.org/download.en.html) the latest version of the Debian ISO and place it in your */sgoinfre/goinfre/Perso/your_login* folder.

<aside>
📌 By placing your virtual machine on the sgoinfre server, you gain the flexibility to switch computers throughout your project. However, if you use the local goinfre folder, you must remain on the same computer for all your work.

</aside>

## Step 1 - Install your **Virtual Machine**

Decide if you will complete the Born2beRoot project with bonuses, as this affects the virtual hard disk size from the very beginning.

<aside>
📌 I intend to complete only the first bonus and perform disk partitioning.

</aside>

1. Open VirtualBox and click 'New'.
2. Name your machine and set `/sgoinfre/goinfre/Perso/your_login` as the Machine folder. Select 'Linux' and 'Debian 64-bit' as the type and version, respectively.
    
    ![Untitled](img/Untitled%202.png)
    
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
    
    ![Untitled](img/Untitled%203.png)
    
3. We accept the confirmation message. Basically, it warns us that if there are already partitions on the device, they will be deleted and that if we are sure to create a new empty partition table.
    
    ![Untitled](img/Untitled%204.png)
    
4. Once we have completed the previous step, we can see how our partition table appears empty. Now we must configure it.
    
    ![Untitled](img/Untitled%205.png)
    
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
    
    ![Untitled](img/Untitled%206.png)
    
    ![Untitled](img/Untitled%207.png)
    
6. `Create a new partition` .
7. `max`.
8. `Logical`.
9. Choose `Do not mount it` as `Mount point`.
10. `Done setting up the partition`.
11. `Configure encrypted volumes`. This way we can encrypt our partition.
12. `Yes`.
13. `Create encrypted volumes`.
14. Select which partition we want to encrypt (Spacebar).
    
    ![Untitled](img/Untitled%208.png)
    
15. `Done setting up the partition`.
16. We `Finish` because we don't want to create more encrypted volumes.
17. `Yes`.
18. `Cancel` it because there is nothing to encrypt since the partition is empty.
19. Enter encryption phrase.
20. `Configure the Logical Volume Manager`.
21. `Yes`.
22. `Create volume group`.
23. Enter the name `LVMGroup` as indicated in the subject.
    
    ![Untitled](img/Untitled%209.png)
    
24. Select the partition where we want to create the group.
    
    ![Untitled](img/Untitled%2010.png)
    
25. Now we must create all the logical partitions.
    
    ![Untitled](img/Untitled%2011.png)
    
    ![Untitled](img/Untitled%2012.png)
    
26. Choose the only one group where we want them to be created - `LVMGroup`.
27. The order of creation of the logical units will be the same as indicated in the subject, so we will start with `root` and end with var-log. 
    
    ![Untitled](img/Untitled%2013.png)
    
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
    
    ![Untitled](img/Untitled%2014.png)
    
3. We must choose a file system as it currently does not have one. `Use as:` `Ext4` file system, it is the most commonly used file system in Linux distributions. `Mount point` > `/home` > `Done`.
4. "LV root", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `/` > `Done`.
5. "LV srv", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `/srv` > `Done`.
6. For `swap`, we will make an exception because the file system will be different. "LV swap", `#1 xxGB` > `Use as` > `swap ares` >`Done`.
7. "LV tmp", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `/tmp` > `Done`.
8. "LV var", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `/var` > `Done`.
9. "LV var-log", `#1 xxGB` > `Use as` > `Ext4` >`Mount point` > `Enter manually` >`/var/log` > `Done`.
10. `Finish partitioning`.
    
    ![Untitled](img/Untitled%2015.png)
    
11. Accept the message and make sure that all of the partitions look the same as in the screenshot.
    
    ![Untitled](img/Untitled%2016.png)
    
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
    
    ![Untitled](img/Untitled%2017.png)
    
5. Type `head -n 2 /etc/os-release` to check OS version.

After successfully installing Debian and checking the disk partitioning, we will configure essential system settings according to the Born2beRoot project subject.
