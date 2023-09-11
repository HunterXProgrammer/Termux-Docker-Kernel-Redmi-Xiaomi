### To know what features your kernel does or doesn't support, you can run this in **Termux**:-

    su -c 'curl -sSL https://raw.githubusercontent.com/moby/moby/master/contrib/check-config.sh | sh'

<br>

#### Some basic info before we get started:-

> **Note**
> Now with colors! It looks even better in Desktop Mode, for smartphone users.

> **Important**
> Docker needs the phone's kernel to, at the very least, be able to support **"Generally Necessary"** kernel features. 
>
> It is to be noted that **"Optional Features"** add more funtionality to Docker, like some flags and resource allocation control. Having them enabled is good to ensure that more Docker containers can function properly.

<br>

#### These are all the **missing kernel features** in the stock MIUI ROM. It makes it **impossible to run Docker**:-
$\textsf{\textbf{\textcolor{black}{⇒ Generally Necessary:}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- cgroup hierarchy:} \textbf{\textcolor{green}{properly mounted}} \textcolor{grey}{[/dev]}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NAMESPACES:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NET\\_NS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_PID\\_NS:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_IPC\\_NS:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_UTS\\_NS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUPS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_CPUACCT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_CGROUP\\_DEVICE:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_FREEZER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_SCHED:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CPUSETS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_MEMCG:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_KEYS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_VETH:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BRIDGE:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BRIDGE\\_NETFILTER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_NF\\_FILTER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_NF\\_TARGET\\_MASQUERADE:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MATCH\\_ADDRTYPE:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MATCH\\_CONNTRACK:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MATCH\\_IPVS:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MARK:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_NF\\_NAT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_POSIX\\_MQUEUE:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT\\_IPV4:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT\\_NEEDED:} \textbf{\textcolor{green}{enabled}}}$<br>

$\textsf{\textbf{\textcolor{black}{⇒ Optional Features:}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_USER\\_NS:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_SECCOMP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_SECCOMP\\_FILTER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_CGROUP\\_PIDS:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_MEMCG\\_SWAP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_MEMCG\\_SWAP\\_ENABLED:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{grey}{(cgroup swap accounting is currently enabled)}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IOSCHED\\_CFQ:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CFQ\\_GROUP\\_IOSCHED:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BLK\\_CGROUP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_BLK\\_DEV\\_THROTTLING:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_CGROUP\\_PERF:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_CGROUP\\_HUGETLB:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_NET\\_CLS\\_CGROUP:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_CGROUP\\_NET\\_PRIO:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_CFS\\_BANDWIDTH:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_FAIR\\_GROUP\\_SCHED:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_NF\\_TARGET\\_REDIRECT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_IP\\_VS:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_IP\\_VS\\_NFCT:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_IP\\_VS\\_PROTO\\_TCP:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_IP\\_VS\\_PROTO\\_UDP:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_IP\\_VS\\_RR:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_SECURITY\\_SELINUX:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_SECURITY\\_APPARMOR:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_EXT4\\_FS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_EXT4\\_FS\\_POSIX\\_ACL:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_EXT4\\_FS\\_SECURITY:} \textbf{\textcolor{green}{enabled}}}$<br>

$\textsf{\textbf{\textcolor{black}{⇒ Network Drivers:}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{overlay}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_VXLAN:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_BRIDGE\\_VLAN\\_FILTERING:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{Optional (for encrypted networks): }}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO\\_AEAD:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO\\_GCM:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO\\_SEQIV:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO\\_GHASH:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_XFRM:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_XFRM\\_USER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_XFRM\\_ALGO:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_INET\\_ESP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MATCH\\_BPF:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_INET\\_XFRM\\_MODE\\_TRANSPORT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{ipvlan}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_IPVLAN:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{macvlan}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_MACVLAN:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_DUMMY:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{ftp,tftp client in container}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT\\_FTP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_CONNTRACK\\_FTP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT\\_TFTP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_CONNTRACK\\_TFTP:} \textbf{\textcolor{green}{enabled}}}$<br>

$\textsf{\textbf{\textcolor{black}{⇒ Storage Drivers:}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{btrfs}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_BTRFS\\_FS:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_BTRFS\\_FS\\_POSIX\\_ACL:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{overlay}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_OVERLAY\\_FS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{zfs}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- /dev/zfs:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- zfs command:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- zpool command:} \textbf{\textcolor{red}{MISSING}}}}$<br>

$\textsf{\textbf{\textcolor{black}{⇒ Limits:}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- /proc/sys/kernel/keys/root\\_maxkeys:} \textbf{\textcolor{green}{1000000}}}$<br>

> **Important**
> Linux doesn't have built-in support for **zfs (Zettabyte File System)** and it was never ported to Android.
>
> The **zfs** command was never necessary for Docker and it's presence/absence doesn't affect Docker at all, so you can ignore it.

<br>

## And then this is the **kernel compiled with the required support** to **run Docker natively**. Nearly all features are enabled:-

$\textsf{\textbf{\textcolor{black}{⇒ Generally Necessary:}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- cgroup hierarchy:} \textbf{\textcolor{green}{properly mounted}} \textcolor{grey}{[/dev]}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NAMESPACES:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NET\\_NS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_PID\\_NS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IPC\\_NS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_UTS\\_NS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUPS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_CPUACCT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_DEVICE:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_FREEZER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_SCHED:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CPUSETS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_MEMCG:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_KEYS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_VETH:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BRIDGE:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BRIDGE\\_NETFILTER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_NF\\_FILTER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_NF\\_TARGET\\_MASQUERADE:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MATCH\\_ADDRTYPE:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MATCH\\_CONNTRACK:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MATCH\\_IPVS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MARK:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_NF\\_NAT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_POSIX\\_MQUEUE:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT\\_IPV4:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT\\_NEEDED:} \textbf{\textcolor{green}{enabled}}}$<br>

$\textsf{\textbf{\textcolor{black}{⇒ Optional Features:}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_USER\\_NS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_SECCOMP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_SECCOMP\\_FILTER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_PIDS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_MEMCG\\_SWAP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_MEMCG\\_SWAP\\_ENABLED:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{grey}{(cgroup swap accounting is currently enabled)}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IOSCHED\\_CFQ:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CFQ\\_GROUP\\_IOSCHED:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BLK\\_CGROUP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BLK\\_DEV\\_THROTTLING:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_PERF:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_HUGETLB:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NET\\_CLS\\_CGROUP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CGROUP\\_NET\\_PRIO:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- CONFIG\\_CFS\\_BANDWIDTH:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_FAIR\\_GROUP\\_SCHED:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_NF\\_TARGET\\_REDIRECT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_VS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_VS\\_NFCT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_VS\\_PROTO\\_TCP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_VS\\_PROTO\\_UDP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IP\\_VS\\_RR:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_SECURITY\\_SELINUX:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_SECURITY\\_APPARMOR:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_EXT4\\_FS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_EXT4\\_FS\\_POSIX\\_ACL:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_EXT4\\_FS\\_SECURITY:} \textbf{\textcolor{green}{enabled}}}$<br>

$\textsf{\textbf{\textcolor{black}{⇒ Network Drivers:}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{overlay}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_VXLAN:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BRIDGE\\_VLAN\\_FILTERING:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{Optional (for encrypted networks): }}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO\\_AEAD:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO\\_GCM:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO\\_SEQIV:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_CRYPTO\\_GHASH:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_XFRM:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_XFRM\\_USER:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_XFRM\\_ALGO:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_INET\\_ESP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NETFILTER\\_XT\\_MATCH\\_BPF:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_INET\\_XFRM\\_MODE\\_TRANSPORT:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{ipvlan}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_IPVLAN:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{macvlan}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_MACVLAN:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_DUMMY:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{ftp,tftp client in container}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT\\_FTP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_CONNTRACK\\_FTP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_NAT\\_TFTP:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_NF\\_CONNTRACK\\_TFTP:} \textbf{\textcolor{green}{enabled}}}$<br>

$\textsf{\textbf{\textcolor{black}{⇒ Storage Drivers:}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{btrfs}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BTRFS\\_FS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_BTRFS\\_FS\\_POSIX\\_ACL:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{overlay}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textcolor{black}{- CONFIG\\_OVERLAY\\_FS:} \textbf{\textcolor{green}{enabled}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- "}\textcolor{blue}{zfs}\textcolor{black}{":}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- /dev/zfs:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- zfs command:} \textbf{\textcolor{red}{MISSING}}}}$<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\textsf{\textbf{\textcolor{black}{- zpool command:} \textbf{\textcolor{red}{MISSING}}}}$<br>

$\textsf{\textbf{\textcolor{black}{⇒ Limits:}}}$<br>
&nbsp;&nbsp; $\textsf{\textcolor{black}{- /proc/sys/kernel/keys/root\\_maxkeys:} \textbf{\textcolor{green}{1000000}}}$<br>

> **Important**
> The **Optional Features** named **CONFIG_CFS_BANDWIDTH** cannot be enabled as it isn't implemented.
>
> If we try to enable it, kernel compilation fails. It's not needed anyways so it's left as is.
>
> It only affects the usage of the `--cpus` flag.
