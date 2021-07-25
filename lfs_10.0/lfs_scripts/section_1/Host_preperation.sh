#satisfying host requirments
#install all the required software manually


# partitioning the hard-disk(using fdisk or gparted )  
	

#formatting the hard disk ( mkfs or mkfs.ext4)


#mount the partition (using mount command)



#creating directory structure in the $LFS dir



#adding user (empty user )on the host machine 
	#groupadd lfs
	#useradd -s /bin/bash -g lfs -m -k /dev/null lfs

# setting up environment ( creating .bashrc and .profile file in lfs home dir)
#creating .profile file in lfs user home dir 
	#cat >~/.profile <<"EOF"
	#exec env -i HOME=$HOEM 
	#TERM=$TERM 
	#PS1='\u:\w\$ ' /bin/bash 
	#EOF

#creating .bashrc file in user's home dir 
	#cat >~/,bashrc <<"EOF"
	#set +h
	#umask 022
	#LFS=/mnt/lfs
	#LC_ALL=POSIX
	#LFS_TGT=$(uname -r)-lfs-linux-gnu
	#PATH=$LFS/tools:$PATH
	#export LFS LC_ALL LFS_TGT PATH
	#EOF









