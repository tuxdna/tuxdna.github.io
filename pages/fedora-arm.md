---
layout: page
title: "Fedora / ARM port"
description: "Notes on Fedora port on ARM architecture"
---

{% include JB/setup %}

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

 * ARM didn't support hardware virtualization earlier however there is some good news: <http://arstechnica.com/business/news/2010/09/arms-eagle-has-landed-meet-the-a15.ars>
   * ARM's Eagle -  the A15 architecture will support hardware virtualization
   * this means that the QEMU guests can run almost as good as an actual hardware would


## OpenArmLab 7th Dec 2010

What happens when an ARM based board is powered ON?
 * Understand the memory map for RAM and ROM
 * First instruction
 * Vector table
 * Stack initialization
 * Relocating the RAM to a different address
 * Running from RAM

A simple program on QEMU/ARM: <https://github.com/tuxdna/arm-experiments/tree/master/bare-metal-hello-world>

    $ yumdownloader --source directfb
    $ rpm -i directfb-1.4.3-1.fc14.src.rpm 
    $ cd ../SPECS/
    $ rpmbuild -ba directfb.spec 
    error: Failed build dependencies:
           libsysfs-devel is needed by directfb-1.4.3-1.fc14.x86_64
           libv4l-devel is needed by directfb-1.4.3-1.fc14.x86_64
           libvncserver-devel is needed by directfb-1.4.3-1.fc14.x86_64
           tslib-devel is needed by directfb-1.4.3-1.fc14.x86_64
    $ yumdownloader --source libsysfs-devel libvncserver-devel libv4l-devel libsysfs-devel
    $ rpm -i libv4l-0.8.1-1.fc14.src.rpm  libvncserver-0.9.7-4.fc14.src.rpm  sysfsutils-2.1.0-8.fc14.src.rpm  tslib-1.0-2.fc12.src.rpm lzo-2.03-3.fc12.src.rpm
    $ cd ../SPECS/
    $ rpmbuild -ba libv4l.spec libvncserver.spec tslib.spec sysfsutils.spec
    $ for r in libv4l-0.8.1-1.fc14.src.rpm  libvncserver-0.9.7-4.fc14.src.rpm  sysfsutils-2.1.0-8.fc14.src.rpm  tslib-1.0-2.fc12.src.rpm lzo-2.03-3.fc12.src.rpm; do arm-koji build  --scratch dist-f13 $r ; done
    
    brigde/tap
    yum install openvpn bridge-utils

    hw/versatilepb.c: static void versatile_init(ram_addr_t ram_size,
                         const char *boot_device,
                         const char *kernel_filename, const char *kernel_cmdline,
                         const char *initrd_filename, const char *cpu_model,
                         int board_id)
    calls this function:
        env = cpu_init(cpu_model);
    
    which expands to a macro defined here:
    target-arm/cpu.h: #define cpu_init cpu_arm_init
    
    and this function gets called
    target-arm/helper.c: CPUARMState *cpu_arm_init(const char *cpu_model)
    

 * [LED Register 0x10000008](http://infocenter.arm.com/help/topic/com.arm.doc.dui0224i/Cachbhig.html)

    only  [7:0] bits of [31:0] total
    rest of the [31:8] bits of [31:0] total are reserved

## Why Fedora ARM / RPM packaging?
 * proven technology already in use on may of the most popular Distros
 * reduce development time and time to market for your next device
   * OLPC is one such example

Fedora ARM Architecture <http://fedoraproject.org/wiki/User:Ctyler/Architectures/ARM>

Fedora ARM howto: <http://fedoraproject.org/wiki/Architectures/ARM/HowToQemu>

RfsBuild - tool to build root filesystem <http://fedoraproject.org/wiki/Architectures/ARM/RfsBuild>

Koji - the Fedora build system <http://fedoraproject.org/wiki/PackageMaintainers/UsingKoji>

Anthony Ligouri - QEMU maintainer - <http://wiki.qemu.org/ChangeLog>

Rusty Russell - <http://swtch.com/lguest/>

Paul Brook - QEMU ARM creator

Linux on Omap3 - Beagleboard and the like: <http://vm-kernel.org/blog/2008/12/15/linux-is-running-on-qemu-omap3/>

Embedded work in Qemu <http://qemu-forum.ipi.fi/viewtopic.php?f=22&t=2923&sid=fad1398e7ac4b986fa15338e39ec3b29>

