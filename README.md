### To check if the apparmor if loaded into the kernel

$ cat /sys/module/apparmor/parameters/enabled

### To check if it is running 

$ systemctl status apparmor

### To check which profiles are loaded in the kernel

$ cat /sys/kernel/security/apparmor/profiles

### Alternative to check profile loaded and enforced

$ aa-status

### Three types of apparmor profiles:

* Enforce: monitor and apply profile on all applications that fits the profile
* Complain: monitor but don't restrict, it will create logs what is happening
* unconfined: as the name implies , unrestricted access

### Packages to create apparmor profiles:

$ apt-get install -y apparmor-utils

### Generating security apparmor-profile

$ aa-genprof /root/add_data.sh

Note: We need to run the above script in the different terminal simultaneously

### Path for our new apparmor profile

$ cat /etc/apparmor.d/root.add_data.sh

### Now to cross-check: 

Run the script with changed values like: "/opt"

### How to add an existing app-armor profile:

$ apparmor_parser /etc/apparmor.d/root.add_data.sh

### How to delete an existing app-armor profile:

* $ apparmor_parser -R /etc/apparmor.d/root.add_data.sh
* $ ln -s /etc/apparmor.d/root.add_data.sh /etc/apparmor.d/disable


## Note: Path to install apparmor profiles 

* path: /etc/apparmor.d/no_raw_net
* permissions: 0644
* owner: root


## Load and unload profiles:

* $ apparmor_parser -r -W /path/to/your_profile
* $ docker run --rm -it --security-opt apparmor=your_profile hello-world
* $ apparmor_parser -R /path/to/profile
