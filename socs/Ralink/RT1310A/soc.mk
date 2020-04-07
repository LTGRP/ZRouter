
#XXX testing
KERNEL_PATH=/usr/obj/kernel

TARGET=			arm
TARGET_ARCH=		arm

KERNCONF_MACHINE=	${TARGET} ${TARGET_ARCH}
KERNCONF_IDENT?=	RT1310A
KERNCONF_CPU+= 		CPU_ARM9E
KERNCONF_FILES+=	"../ralink/files.ralink"
KERNCONF_MAKEOPTIONS+=	"CONF_CFLAGS=-march=armv5te"

KERNCONF_MAKEOPTIONS+=	"KERNPHYSADDR=0x40000000"
KERNCONF_MAKEOPTIONS+=	"KERNVIRTADDR=0xc0000000"

KERNCONF_OPTIONS+=	PHYSADDR=0x40000000
KERNCONF_OPTIONS+=	KERNVIRTADDR=0xc0000000

PHYSADDR=		0x40000000

#KERNCONF_OPTIONS+=	COMPAT_FREEBSD10
#KERNCONF_OPTIONS+=	COMPAT_FREEBSD11

# map to 64MByte at locore-v4.S for debug
# map to 0xcc000000 - 0xcfffffff from 0x1c000000 - 0x1fffffff
#KERNCONF_OPTIONS+=	SOCDEV_PA=0x1c000000
#KERNCONF_OPTIONS+=	SOCDEV_VA=0xcc000000
#KERNCONF_OPTIONS+=	EARLY_PRINTF;

#KERNCONF_OPTIONS+=	FLASHADDR=0x50000000
#KERNCONF_OPTIONS+=	LOADERRAMADDR=0x00000000
#KERNCONF_OPTIONS+=	STARTUP_PAGETABLE_ADDR=0x00000000

#KERNCONF_OPTIONS+=	LINUX_BOOT_ABI

KERNCONF_OPTIONS+=	FDT
KERNCONF_OPTIONS+=	FDT_DTB_STATIC
#KERNCONF_MAKEOPTIONS+=	"FDT_DTS_FILE=wzr2-g300n.dts"

KERNCONF_OPTIONS+=	INTRNG

#KERNCONF_OPTIONS+= 	HWPMC_HOOKS
KERNCONF_OPTIONS+= 	VERBOSE_INIT_ARM
#KERNCONF_OPTIONS+= 	IXP4XX_FLASH_SIZE=0x00400000
#KERNCONF_OPTIONS+= 	ATA_CAM
#KERNCONF_OPTIONS+= 	ATA_STATIC_ID
#KERNCONF_OPTIONS+= 	USB_EHCI_BIG_ENDIAN_DESC
#KERNCONF_OPTIONS+=	NO_EVENTTIMERS

KERNCONF_OPTIONS+=		MAXUSERS=3
KERNCONF_OPTIONS+=		MAXFILES=512
KERNCONF_OPTIONS+=		NSFBUFS=1024
KERNCONF_OPTIONS+=		SHMALL=128
KERNCONF_OPTIONS+=		MSGBUF_SIZE=65536

# Options for making kernel smallest 
KERNCONF_OPTIONS+=		NO_SYSCTL_DESCR
KERNCONF_OPTIONS+=		NO_FFS_SNAPSHOT
KERNCONF_OPTIONS+=		SCSI_NO_SENSE_STRINGS
KERNCONF_OPTIONS+=		SCSI_NO_OP_STRINGS


# Debug definitions
##KERNCONF_MAKEOPTIONS+=	"DEBUG=-g"
KERNCONF_OPTIONS+=		DDB
KERNCONF_OPTIONS+=		KDB
#KERNCONF_OPTIONS+=		PREEMPTION
##KERNCONF_OPTIONS+=		KTRACE
#KERNCONF_OPTIONS+=		LOCK_PROFILING
#KERNCONF_OPTIONS+=		KTR

# Board definitions
KERNCONF_OPTIONS+=	INET
KERNCONF_OPTIONS+= 	IPSTEALTH
#KERNCONF_OPTIONS+= 	FFS
#KERNCONF_OPTIONS+= 	SOFTUPDATES
#KERNCONF_OPTIONS+= 	UFS_ACL
#KERNCONF_OPTIONS+= 	UFS_DIRHASH
#KERNCONF_OPTIONS+= 	TMPFS
KERNCONF_OPTIONS+= 	CD9660
#KERNCONF_OPTIONS+= 	GEOM_LABEL
#KERNCONF_OPTIONS+= 	SCHED_ULE
KERNCONF_OPTIONS+= 	SCHED_4BSD
#KERNCONF_OPTIONS+= 	NFSCLIENT
#KERNCONF_OPTIONS+= 	NFS_ROOT
KERNCONF_OPTIONS+= 	PSEUDOFS
KERNCONF_OPTIONS+=	_KPOSIX_PRIORITY_SCHEDULING

#KERNCONF_OPTIONS+= 	SMP

#KERNCONF_DEVICES+=	pci

KERNCONF_DEVICES+=	loop
KERNCONF_DEVICES+=	pty
KERNCONF_DEVICES+=	ether
KERNCONF_DEVICES+=	bpf
KERNCONF_DEVICES+=	uart
KERNCONF_DEVICES+=	uart_ns8250

#KERNCONF_DEVICES+=	tuntap
#KERNCONF_DEVICES+=	vlan

KERNCONF_DEVICES+=	gpio
KERNCONF_DEVICES+=	gpioled
KERNCONF_DEVICES+=	rt1310gpio

KERNCONF_DEVICES+=	fv
KERNCONF_DEVICES+=	mii
#KERNCONF_DEVICES+=	miibus

#KERNCONF_OPTIONS+= 	SC_PIXEL_MODE

KERNCONF_OPTIONS+= 	CAMDEBUG

KERNCONF_OPTIONS+=	SCSI_DELAY=1000

.if defined(WITH_IPSEC)
KERNCONF_OPTIONS+=         IPSEC

KERNCONF_DEVICES+=		enc
KERNCONF_DEVICES+=		ipsec
KERNCONF_DEVICES+=		crypto
.endif


#	sys/boot/uboot
#	sys/boot/arm/uboot

