# Fedora ARM

A basic hands-on with QEMU/ARM
Current state of affairs with Fedora/ARM
Future plans and ideas


## Technical notes:

    hw/arm_boot.c:
     
    #define KERNEL_ARGS_ADDR 0x100
    #define KERNEL_LOAD_ADDR 0x00010000
    #define INITRD_LOAD_ADDR 0x00800000
    
Which all machines/boards are registered inside QEMU?

search for references of C function: qemu_register_machine

## Building Rootfs:

Install rfsbuild:

    yum localinstall --nogpgcheck http://ftp.linux.org.uk/pub/linux/arm/fedora/rfsbuild/rfsbuild-0.9.0-beta.noarch.rpm

Reference: <http://ftp.linux.org.uk/pub/linux/arm/fedora/qemu/00README.txt>


## Current state of affairs in Fedora/ARM

Floating point support in the Fedora/ARM cross toolchain is in progress:

 * discussion is on for which of soft/softfp or hardfp to select for upcoming ARMv7 support
 * OLPCs (currently the only eager to use Fedora ARM for an actual project) 
   but they seem to be aiming to jump from F-11 to F-14
 * for their next release, but I don't know if that includes the XO-1.75.

## What are the limitions with using QEMU as koji builders?
 * QEMU runs at a fraction of the speed of an actual hardware ( compared with GuruPlug/SheevaPlug for example)
 * unless there is hardware virtualization support the speed difference will be significant
 * hardware virtualization will work if the host OS has similar hardware
  * example qemu-system-x86 running on a Fedora-x86 host
 * ARM didn't support hardware virtualization earlier however there is some good news:
  * <http://arstechnica.com/business/news/2010/09/arms-eagle-has-landed-meet-the-a15.ars>
   * ARM's Eagle -  the A15 architecture will support hardware virtualization
   * this means that the QEMU guests can run almost as good as an actual hardware would
