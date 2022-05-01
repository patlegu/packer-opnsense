# OPNsense Hetzner
## Hetzner Hcloud CMD line
The easiest way to get information from the cmd line is using [hetzner cloud cmdline](https://github.com/hetznercloud/cli)
To use it, you need to used your hetzner token, so on possibility:
* Put it in the vars.json (copy vars.example.json)
* install jq ([sed for json](https://stedolan.github.io/jq/)) on your server if you don't have it.
* initialize you token as a variable:
```
export HCLOUD_TOKEN=$(jq -r .hcloud_token vars.json)
```
You're ready to use the ***CLI***.
Some information you can get from this tools and usable directly from bash.
## Possible values for differents data usable for Hetzner Cloud.
### Possible values for Location:
```
 hcloud location list
ID   NAME   DESCRIPTION             NETWORK ZONE   COUNTRY   CITY
1    fsn1   Falkenstein DC Park 1   eu-central     DE        Falkenstein
2    nbg1   Nuremberg DC Park 1     eu-central     DE        Nuremberg
3    hel1   Helsinki DC Park 1      eu-central     FI        Helsinki
4    ash    Ashburn, VA             us-east        US        Ashburn, VA
```
### Possible values for Datacenter:
```
hcloud datacenter list
ID   NAME        DESCRIPTION          LOCATION
2    nbg1-dc3    Nuremberg 1 DC 3     nbg1
3    hel1-dc2    Helsinki 1 DC 2      hel1
4    fsn1-dc14   Falkenstein 1 DC14   fsn1
5    ash-dc1     Ashburn DC1          ash
```
### Possible value for server-type:
```
hcloud server-type list
ID   NAME    CORES   MEMORY     DISK     STORAGE TYPE
1    cx11    1       2.0 GB     20 GB    local
3    cx21    2       4.0 GB     40 GB    local
5    cx31    2       8.0 GB     80 GB    local
7    cx41    4       16.0 GB    160 GB   local
9    cx51    8       32.0 GB    240 GB   local
11   ccx11   2       8.0 GB     80 GB    local
12   ccx21   4       16.0 GB    160 GB   local
13   ccx31   8       32.0 GB    240 GB   local
14   ccx41   16      64.0 GB    360 GB   local
15   ccx51   32      128.0 GB   600 GB   local
22   cpx11   2       2.0 GB     40 GB    local
23   cpx21   3       4.0 GB     80 GB    local
24   cpx31   4       8.0 GB     160 GB   local
25   cpx41   8       16.0 GB    240 GB   local
26   cpx51   16      32.0 GB    360 GB   local
33   ccx12   2       8.0 GB     80 GB    local
34   ccx22   4       16.0 GB    160 GB   local
35   ccx32   8       32.0 GB    240 GB   local
36   ccx42   16      64.0 GB    360 GB   local
37   ccx52   32      128.0 GB   600 GB   local
38   ccx62   48      192.0 GB   960 GB   local
```
with the follawing helps for the ***hclouc server list*** columns values. 
Note that even if the columns is in capitals, the value must be in lowercase.
```
hcloud server list
ID         NAME               STATUS    IPV4            IPV6                    DATACENTER
12345678   debian-2gb-ash-1   running   ww.xxx.yy.zzz   www:xxx:yy:zzzz::/64   ash-dc1
```
To have only the IP address of the server
```
hcloud server list  --output noheader --output columns=ipv4
```
```
Displays a list of servers.

Output can be controlled with the -o flag. Use -o noheader to suppress the
table header. Displayed columns and their order can be set with
-o columns=backup_window,datacenter (see available columns below).

Columns:
 - backup_window
 - datacenter
 - id
 - ipv4
 - ipv6
 - labels
 - location
 - locked
 - name
 - private_net
 - protection
 - rescue_enabled
 - status
 - type
 - volumes

Usage:
  hcloud server list [FLAGS]

Flags:
  -h, --help                 help for list
  -o, --output stringArray   output options: noheader|columns=...
  -l, --selector string      Selector to filter by labels
```