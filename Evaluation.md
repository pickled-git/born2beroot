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
