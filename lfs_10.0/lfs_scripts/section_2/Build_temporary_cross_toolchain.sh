#/* Disclamer*/
#Make sure Host is prepared for compiling the toolchain 
#partition should be mount under $LFS
# $LFS varibale must be exported and $LFS/tools and $LFS/sources directories are exist
#And all the sources are in the $LFS/sources dir (extracted)
#lfs user must have full control on $LFS/sources dir 


#/*start compiling toolchain */

echo "Welcome to this advancture"
sleep 10

#/*Binutils*/

$LFS/sources
tar -xvf binutils-2.35.tar.xz
cd binutils-2.35
mkdir binutils-build
cd binutils-build
../configure --prefix=$LFS/tools \
	--with-sysroot=$LFS 	 \
	--target=$LFS_TGT	 \
	--disable-nls		\
	--disable-werror
make 
make install 
cd ../../
rm -rf binutils-build





#/*GCC */
echo "Starting with gcc package ...."
sleep 10


tar -xvf gcc-10.2.0.tar.xz
cd gcc-10.2.0 
#? dependency resolve 
#gcc package dependes on mpc , mpfr and gmp packages 
tar -xvf../mpc-1.1.0.tar.gz
mv mpc-1.1.0 mpc
tar -xvf ../gmp-6.2.0.tar.xz
mv gmp-6.2.0 gmp
tar -xvf ../mpfr-4.1.0.tar.xz
mv mpfr-4.1.0 mpfr
#dependency are resolved , now procceed with compilation 
mkdir gcc-build
cd gcc-build
../configure --target=$LFS_TGT	\
	--prefix=$LFS/tools	\
	--with-glibc-version=2.11 \
	--with-sysroot=$LFS	  \
	--with-newlib		  \
	--without-headers	  \
	--enable-initfini-array	  \
	--disable-nls		  \
	--disable-shared	  \
	--disable-multilib	  \
	--disable-decimal-float   \
	--disable-threads	  \
	--disable-libatomic	  \
	--disable-libgomp	  \
	--disable-libquadmath	  \
	--disable-libssp	  \
	--disbale-libvtv	  \
	--disable-libstdcxx	  \
	--enable-lanuages=c,c++
make 
make install 
#Note 
cd ../
cat gcc/limitx.h gcc/glimits.h gcc/limity.h \
	`dirname $($LFS_TGT-gcc -print-libgcc-file-name) ` /install-tools/include/limits.h

cd ../
rm -rf gcc-10.2.0




#/* linux API  headers */
echo "stating with installing linux API"
sleep 10

tar -xvf linux-5.8.3.tar.xz
cd linux-5.8.3/
make mrproper
make headers
find usr/include -name '.*' -delete
rm -rf usr/include/Makefile
cp -rv usr/include/ $LFS/usr

cd ../
rm -rf linux-5.8.3





#/*GLIBC */
echo starting with GLIBC 
sleep 10

#? creating a symbolic link for LSB compliance 
case $(uname -r) in
	i?86) ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3 ;;
	x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
		ln -svf ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so3
		;;
esac

#?patching the glibc
patch -Np1 -i ../glibc-2.32-fhs-1.patch


