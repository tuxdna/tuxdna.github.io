# GlusterFS

Gluster concepts / terminology:

 * brick
 * client
 * server
 * subvolume
 * volume



Building from source:

Checkout code:

    $ git clone git://github.com/gluster/glusterfs.git
    $ cd glusterfs
    
Build and install

    $ ./autogen.sh
    $ ./configure --prefix=/usr  --enable-shared --enable-fusermount
    $ make 
    $ sudo make install
    
Start the service

    $ sudo systemctl --system daemon-reload
    $ /etc/init.d/glusterd start
    Starting glusterd (via systemctl):                         [  OK  ]


## Package based setup 

Create trusted storage pool: <http://www.gluster.com/community/documentation/index.php/Gluster_3.1:_Creating_Trusted_Storage_Pools>

Setup server: <http://www.gluster.com/community/documentation/index.php/Gluster_3.1:_Installing_GlusterFS_on_Red_Hat_Package_Manager_%28RPM%29_Distributions>

    sudo yum -y install wget fuse fuse-libs
    sudo yum  install glusterfs-server
    yum install fuse-sshfs
    yum install glusterfs glusterfs-fuse # can be ignored for now
    

Create a volume:

    # gluster volume create tmnr_data transport tcp host1:/data/disk1/data1
    # gluster volume start tmnr_data
    Starting volume tmnr_data has been successful
    # gluster volume stop tmnr_data
    Stopping volume will make its data inaccessible. Do you want to Continue? (y/n) y
    Stopping volume tmnr_data has been successful
    # gluster volume log filename test-volume /var/log/test-volume/
    log filename : successful
    

On the server:

    yum install glusterfs-server

On the client: <http://www.gluster.com/community/documentation/index.php/Client_Installation_and_Configuration>

    yum install glusterfs glusterfs-fuse


This worked on localhost.


## Gluster Test run:

On server:

    [root@fedorabox export1]# gluster volume create myvol1 192.168.122.1:/data/gfsexports/export1
    [root@fedorabox export1]# gluster volume start myvol1

On client:

    [root@localhost mnt]# mkdir /mnt/gfsdata
    [root@localhost mnt]# mount -t glusterfs 192.168.122.1:myvol1 /mnt/gfsdata


References:

Cluster de Almacenamiento con GlusterFS 3 y CentOS 5.6: <http://www.muspells.net/blog/2011/05/cluster-de-almacenamiento-con-glusterfs-3-y-centos-5-6/>

GlusterFS 3 on x86 64 CentOS 5.4: <http://misterx.org/wiki/index.php/GlusterFS_3_on_x86_64_CentOS_5.4>


Building a Private Cloud: Experimenting with GlusterFS: <http://rm-rf.ca/comment/reply/41>
