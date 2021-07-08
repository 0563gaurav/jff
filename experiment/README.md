# jff (Just For Fun)

Selfbootable code --> 


  boot_sec.asm file contains self bootable code, it just boots the machine from the hard drive                      

HelloWorld Bootloader  -->        

   Hello_world.asm contains Hello bootloader , it prints hello message on the boot screen with the help of BIOS ISR(intrrupt service routien)         

Tools -->        

  Buliding the file to run on your computer , one should have -->    
  
  1. linux(on x86_64 Archiecture ) machine (os) up and running     
  
  2.nasm assembler        
  
  3. qemu or bochs emulator ( for runing the binary)      
  
 Command for building on x86_64 ubuntu/debian based destro --> 
 
 
   $ apt-get install nasm qemu-system-x86_64  ( preparing the building environment / installing tools  )           
   
   $ nasm -f bin Helloworld.asm --> -f bin flag indicate assemble static raw binary (cpu does not know notion file/file-system)     
   
   $ nsam -f bin boot_sec.asm      
   
   To run on qemu emulator -->      
   
   $ qemu-system-x86_64 boot_sec      
   
   $ qemu-system-x86_64 Hello_world       
   
   
  Running on real machine (bare-metal)  
  
      Needed tools -->      
      
      1. pendrive/thumb/usb-flashdrive 
      
      
      
