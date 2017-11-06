

#XXX testing
LZMA=lzma
KERNEL_PATH=/usr/obj/kernel


TARGET=			mips
TARGET_ARCH=		mipsel

KERNCONF_MACHINE=	${TARGET} ${TARGET_ARCH}
KERNCONF_IDENT?=	BCM5356
KERNCONF_CPU=		CPU_MIPS74K
KERNCONF_FILES+=	"../broadcom/files.broadcom"
KERNCONF_HINTS=		"BCM5356.hints"

#KERNCONF_KERN_LDSCRIPT_NAME=	ldscript.mips.cfe

KERNCONF_OPTIONS+=	INTRNG

KERNCONF_MAKEOPTIONS+=	"MIPS_LITTLE_ENDIAN=defined"


# XXX Maybe project definitions, maybe only board

KERNCONF_MAKEOPTIONS+=	"INLINE_LIMIT=768"
KERNCONF_OPTIONS+=		MAXUSERS=3
KERNCONF_OPTIONS+=		MAXFILES=512
#KERNCONF_OPTIONS+=		NMBCLUSTERS=1024
KERNCONF_OPTIONS+=		NSFBUFS=256
KERNCONF_OPTIONS+=		SHMALL=128
KERNCONF_OPTIONS+=		MSGBUF_SIZE=65536
#KERNCONF_MAKEOPTIONS+=		"BHND_LOGLEVEL=BHND_TRACE_LEVEL"

# Options for making kernel smallest 
KERNCONF_OPTIONS+=		NO_SYSCTL_DESCR		# No description string of sysctl
KERNCONF_OPTIONS+=		NO_FFS_SNAPSHOT		# Disable Snapshot supporting
KERNCONF_OPTIONS+=		SCSI_NO_SENSE_STRINGS
KERNCONF_OPTIONS+=		SCSI_NO_OP_STRINGS
#KERNCONF_OPTIONS+=		MUTEX_NOINLINE
KERNCONF_OPTIONS+=		RWLOCK_NOINLINE
KERNCONF_OPTIONS+=		SX_NOINLINE
#KERNCONF_OPTIONS+=		NO_SWAPPING

# Debug definitions
KERNCONF_OPTIONS+=		DDB
KERNCONF_OPTIONS+=		KDB
KERNCONF_OPTIONS+=		CFE
#KERNCONF_OPTIONS+=		CFE_CONSOLE
#KERNCONF_OPTIONS+=		CFE_ENV

# Custom build definitions
#KERNCONF_OPTIONS+=	NFSCLIENT
#KERNCONF_OPTIONS+=	NFS_ROOT
#KERNCONF_OPTIONS+= 	FFS
#KERNCONF_OPTIONS+= 	SOFTUPDATES
#KERNCONF_OPTIONS+= 	UFS_ACL
#KERNCONF_OPTIONS+= 	UFS_DIRHASH
#KERNCONF_OPTIONS+= 	UFS_GJOURNAL
#KERNCONF_OPTIONS+= 	MSDOSFS
#KERNCONF_OPTIONS+= 	PROCFS
#KERNCONF_OPTIONS+= 	BOOTP
#KERNCONF_OPTIONS+= 	BOOTP_NFSROOT
#KERNCONF_OPTIONS+= 	BOOTP_NFSV3
#KERNCONF_OPTIONS+= 	BOOTP_WIRED_TO=bfe0
#KERNCONF_OPTIONS+= 	BOOTP_COMPAT
#KERNCONF_OPTIONS+=		ROOTDEVNAME=\"nfs:192.168.0.90:/usr/home/ray/Projects/MIPS/FreeBSD/rootfs-mips\"
KERNCONF_OPTIONS+=		ROOTDEVNAME=\\\"cd9660:/dev/map/rootfs.uzip\\\"


# Board definitions
KERNCONF_OPTIONS+=	INET
KERNCONF_OPTIONS+= 	TMPFS
KERNCONF_OPTIONS+= 	CD9660
#KERNCONF_OPTIONS+= 	GEOM_LABEL
KERNCONF_DEVICES+=	geom_map
KERNCONF_DEVICES+=	geom_uzip
KERNCONF_DEVICES+=	nvram2env

# Project definitions
KERNCONF_OPTIONS+=	SCHED_4BSD
KERNCONF_OPTIONS+=	PSEUDOFS
KERNCONF_OPTIONS+=	_KPOSIX_PRIORITY_SCHEDULING

KERNCONF_DEVICES+=	intrng

# XXX notyet; need to be auto probed children of siba_cc.
KERNCONF_DEVICES+=	uart
#KERNCONF_NODEVICES+=	uart_ns8250
KERNCONF_OPTIONS+=	UART_DEV_TOLERANCE_PCT=50

KERNCONF_DEVICES+=	bhnd
KERNCONF_DEVICES+=	bcma
KERNCONF_DEVICES+=	bcma_nexus
#KERNCONF_DEVICES+=	bhnd_pcib
#KERNCONF_DEVICES+=	pci

#KERNCONF_DEVICES+=	siba_cc
#KERNCONF_DEVICES+=	siba_mips
#KERNCONF_DEVICES+=	siba_sdram

#KERNCONF_DEVICES+=	bfe
#KERNCONF_DEVICES+=	bgmac
#KERNCONF_OPTIONS+= 	BFE_PACKET_LIST_CNT=32
#KERNCONF_DEVICES+=	miibus
#KERNCONF_DEVICES+=	mii

#KERNCONF_DEVICES+=	etherswitch
#KERNCONF_DEVICES+=	miiproxy
#KERNCONF_DEVICES+=	mdio
#KERNCONF_DEVICES+=	ukswitch
#WORLD_SUBDIRS_SBIN+=	etherswitchcfg

#KERNCONF_DEVICES+=	gpio
#KERNCONF_DEVICES+=	gpioled


KERNCONF_DEVICES+=	loop
KERNCONF_DEVICES+=	ether
#KERNCONF_DEVICES+= 	tun
KERNCONF_DEVICES+= 	pty
#KERNCONF_DEVICES+=	md
KERNCONF_DEVICES+= 	bpf
KERNCONF_DEVICES+=	vlan
#KERNCONF_DEVICES+=	lagg
#KERNCONF_DEVICES+=     if_bridge


KERNCONF_DEVICES+=	spibus
KERNCONF_DEVICES+=	mx25l
#KERNCONF_DEVICES+=	cfi
#KERNCONF_DEVICES+=	cfid


#KERNCONF_DEVICES+=	wlan
#KERNCONF_DEVICES+=	wlan_wep
#KERNCONF_DEVICES+=	wlan_ccmp
#KERNCONF_DEVICES+=	wlan_tkip
#KERNCONF_DEVICES+=	wlan_xauth
#KERNCONF_DEVICES+=	wlan_acl
#KERNCONF_DEVICES+=	wlan_amrr

#KERNCONF_DEVICES+=	firmware
#KERNCONF_DEVICES+=	bwn
#KERNCONF_DEVICES+=	bwi

KERNCONF_DEVICES+=	random

.if defined(WITH_IPSEC)
KERNCONF_OPTIONS+=      IPSEC

KERNCONF_DEVICES+=	enc
#KERNCONF_DEVICES+=	gif
KERNCONF_DEVICES+=	ipsec
KERNCONF_DEVICES+=	crypto
#KERNCONF_DEVICES+=	cryptodev

##KERNCONF_DEVICES+=	rndtest
#KERNCONF_DEVICES+=	ubsec_siba
.endif


.if defined(WITH_USB)
#KERNCONF_OPTIONS+=	USB_EHCI_BIG_ENDIAN_DESC
#KERNCONF_OPTIONS+=	USB_DEBUG
#KERNCONF_OPTIONS+=	USB_VERBOSE

KERNCONF_DEVICES+=	usb
KERNCONF_DEVICES+=	ehci
KERNCONF_DEVICES+=	ohci
.endif


#KERNCONF_DEVICES+=	udbp
#KERNCONF_DEVICES+=	uhid
#KERNCONF_DEVICES+=	ukbd
#KERNCONF_DEVICES+=	ulpt
#KERNCONF_DEVICES+=	umass
#KERNCONF_DEVICES+=	ums
#KERNCONF_DEVICES+=	ural
#KERNCONF_DEVICES+=	rum
#KERNCONF_DEVICES+=	zyd
#KERNCONF_DEVICES+=	urio
# USB Serial devices
#KERNCONF_DEVICES+=	u3g
#KERNCONF_DEVICES+=	umodem
#KERNCONF_DEVICES+=	uark
#KERNCONF_DEVICES+=	ubsa
#KERNCONF_DEVICES+=	uftdi
#KERNCONF_DEVICES+=	uipaq
#KERNCONF_DEVICES+=	uplcom
#KERNCONF_DEVICES+=	uslcom
#KERNCONF_DEVICES+=	uvisor
#KERNCONF_DEVICES+=	uvscom
# USB Ethernet, requires miibus
#KERNCONF_DEVICES+=	aue
#KERNCONF_DEVICES+=	axe
#KERNCONF_DEVICES+=	cdce
#KERNCONF_DEVICES+=	cue
#KERNCONF_DEVICES+=	kue
#KERNCONF_DEVICES+=	rue
#KERNCONF_DEVICES+=	udav



# SCSI peripherals
#KERNCONF_DEVICES+=     scbus
#KERNCONF_DEVICES+=     da
#KERNCONF_DEVICES+=     sa
#KERNCONF_DEVICES+=     cd
#KERNCONF_DEVICES+=     pass
##KERNCONF_DEVICES+=	cam




kernel_deflate:	${DEPEND_ON_LZMA}
	${DEBUG}${LZMA} e ${KERNEL_PATH} ${KERNEL_PATH}.lzma
	${DEBUG}cp ${KERNEL_PATH} ${KERNEL_PATH}.unpacked
	${DEBUG}cp ${KERNEL_PATH}.lzma ${KERNEL_PATH}

