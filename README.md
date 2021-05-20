<b><h1>Docker Image</h1></b>
https://hub.docker.com/r/ryanwarwick/chia-docker-vnc-desktop-plotng

```docker pull ryanwarwick/chia-docker-vnc-desktop-plotng```
<b><h1>Quickstart</h1></b>

<h3>To Run:</h3>

```docker run  -p 8444:8444 -p 8084:80 --name chia-docker-vnc-deskto -v /dev/shm:/dev/shm -v /mnt/plotting:/plotting -v /mnt/plots:/plots -v /mnt/.chia:/home/$USER/.chia  --cap-add=SYS_ADMIN ryanwarwick/chia-docker-vnc-desktop-plotng:latest```

<h3>WHERE:</h3>
<ul>
<li>/mnt/plotting <i>is your temporary directory (SSD)</i></li>
<li>/mnt/plots <i>is your plot storage directory (HDD)</i></li>
<li>/mnt/.chia <i>is your persistent appdata directory and $USER is your user specified in ENV VARIABLES</i></li>
</ul>


<h3>ENV Variables:</h3>
<ul>
<li>KEYS = <i> "/home/$USER/.chia/mnemonic.txt"    // default is "generate" (to create new set of keys)</i></li>
<li>USER = <i>the linux user to be used    // default is "chia" with password of "ubuntu"</i></li>
<li>HTTP_PASSWORD = <i>the password to secure VNC web access     // default is "chiapass"</i></li>
</ul>

<h3>Usage:</h3>

VNC Web UI is available at ```http://IP_ADDRESS:8084``` after initializing container.     <i>// where IP_ADDRESS is localhost if accessing on host PC, otherwise ip address of docker container/host</i>


<h2>Credits</h2>
<ul>
<li>Chia Plotng - https://github.com/maded2/plotng</li>
<li>Chia Blockchain - https://github.com/Chia-Network/chia-blockchain</li>
<li>Ubuntu Focal VNC Desktop for Docker - https://github.com/fcwu/docker-ubuntu-vnc-desktop</li>
</ul>

<h2>Notes</h2>
Chia version updated as of: 20-5-2021 (main branch)

My second proper public docker image :). Feedback and assistance is greatly appreciated. 

<h2>Donations</h2>
Donations are very much appreciated :)

```xch19pfe282trxjfxewpuxc2mumyhdr0frr4jywrqyc3w2jqe6sq8kzsjtxlqt```
