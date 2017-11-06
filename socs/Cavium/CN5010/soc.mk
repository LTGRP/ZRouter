
#XXX testing
LZMA=lzma
KERNEL_PATH=/usr/obj/kernel

TARGET=			mips
TARGET_ARCH=		mips64

KERNCONF_MACHINE=	${TARGET} ${TARGET_ARCH}
KERNCONF_IDENT?=	CN5010
KERNCONF_CPU=		CPU_CNMIPS
KERNCONF_FILES+=	"../cavium/files.octeon1"
KERNCONF_HINTS=		"OCTEON1.hints"

KERNCONF_MAKEOPTIONS+=	"ARCH_FLAGS=\"-march=octeon -mabi=64\""
KERNCONF_MAKEOPTIONS+=	"MIPS_BIG_ENDIAN=defined"
#KERNCONF_MAKEOPTIONS+=	"LDSCRIPT_NAME=ldscript.mips.octeon1"
KERNCONF_KERN_LDSCRIPT_NAME=	ldscript.mips.octeon1
#KERNCONF_KERN_LDSCRIPT_NAME=
KERNCONF_KERNLOADADDR?=		0xffffffff80100000
#KERNCONF_KERNENTRYPOINT?=	0xffffffff80100080

KERNCONF_OPTIONS+=	MALLOC_DEBUG_MAXZONES=8

KERNCONF_OPTIONS+=		SMP
#KERNCONF_OPTIONS+=		MAXUSERS=3
#KERNCONF_OPTIONS+=		MAXFILES=512
#KERNCONF_OPTIONS+=		NSFBUFS=1024
#KERNCONF_OPTIONS+=		SHMALL=128
KERNCONF_OPTIONS+=		MSGBUF_SIZE=65536
KERNCONF_OPTIONS+=		KTRACE
KERNCONF_OPTIONS+=		STACK
KERNCONF_OPTIONS+=		SYSVSHM
KERNCONF_OPTIONS+=		SYSVMSG
KERNCONF_OPTIONS+=		SYSVSEM
KERNCONF_OPTIONS+=		_KPOSIX_PRIORITY_SCHEDULING
KERNCONF_OPTIONS+=		PRINTF_BUFR_SIZE=128

# Options for making kernel smallest 
KERNCONF_OPTIONS+=		NO_SYSCTL_DESCR
KERNCONF_OPTIONS+=		NO_FFS_SNAPSHOT
KERNCONF_OPTIONS+=		SCSI_NO_SENSE_STRINGS
KERNCONF_OPTIONS+=		SCSI_NO_OP_STRINGS

# Debug definitions
##KERNCONF_MAKEOPTIONS+=	"DEBUG=-g"
KERNCONF_OPTIONS+=		ALT_BREAK_TO_DEBUGGER
KERNCONF_OPTIONS+=		DDB
KERNCONF_OPTIONS+=		KDB
##KERNCONF_OPTIONS+=		KTRACE
#KERNCONF_OPTIONS+=		LOCK_PROFILING
#KERNCONF_OPTIONS+=		KTR

KERNCONF_OPTIONS+=		PREEMPTION

# Board definitions
KERNCONF_OPTIONS+=	INET
KERNCONF_OPTIONS+= 	IPSTEALTH
KERNCONF_OPTIONS+= 	CD9660
#KERNCONF_OPTIONS+= 	GEOM_LABEL
KERNCONF_OPTIONS+= 	SCHED_ULE
#KERNCONF_OPTIONS+= 	SCHED_4BSD
#KERNCONF_OPTIONS+= 	NFSCLIENT
#KERNCONF_OPTIONS+= 	NFS_ROOT
KERNCONF_OPTIONS+= 	PSEUDOFS
KERNCONF_OPTIONS+=	IPFIREWALL_DEFAULT_TO_ACCEPT
KERNCONF_OPTIONS+=	_KPOSIX_PRIORITY_SCHEDULING

KERNCONF_DEVICES+=	random
KERNCONF_DEVICES+=	loop
KERNCONF_DEVICES+=	pty
KERNCONF_DEVICES+=	ether
KERNCONF_DEVICES+=	bpf
KERNCONF_DEVICES+=	vlan
KERNCONF_DEVICES+=	uart
KERNCONF_DEVICES+=	tun

KERNCONF_DEVICES+=	pci

KERNCONF_DEVICES+=	mii
KERNCONF_DEVICES+=	octe
KERNCONF_DEVICES+=	octm
KERNCONF_DEVICES+=	octeon_wdog


KERNCONF_DEVICES+=	gpio
KERNCONF_DEVICES+=	gpioled

KERNCONF_DEVICES+=	cfi
KERNCONF_DEVICES+=	cfid
#KERNCONF_DEVICES+=	nvram2env
KERNCONF_DEVICES+=	geom_map
KERNCONF_DEVICES+=	geom_uzip


KERNCONF_OPTIONS+=	SCSI_DELAY=1000

.if defined(WITH_IPSEC)
KERNCONF_OPTIONS+=         IPSEC
KERNCONF_OPTIONS+=         IPSEC_NAT_T

KERNCONF_DEVICES+=		enc
#KERNCONF_DEVICES+=		gif
KERNCONF_DEVICES+=		ipsec
KERNCONF_DEVICES+=		crypto
KERNCONF_DEVICES+=		cryptodev	# /dev/crypto for access to h/w
KERNCONF_DEVICES+=		cryptocteon

##KERNCONF_DEVICES+=		rndtest		# FIPS 140-2 entropy tester
.endif

.if defined(WITH_USB)
KERNCONF_DEVICES+=	usb
#KERNCONF_OPTIONS+=	USB_DEBUG
#KERNCONF_DEVICES+=	cndotg
KERNCONF_DEVICES+=	octusb
.endif






