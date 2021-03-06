
#XXX testing
LZMA=lzma
KERNEL_PATH=/usr/obj/kernel

TARGET=			mips
TARGET_ARCH=		mipsel

KERNCONF_MACHINE=	${TARGET} ${TARGET_ARCH}
KERNCONF_IDENT?=	RT3050F
KERNCONF_CPU=		CPU_MIPS4KC
KERNCONF_FILES+=	"../rt305x/files.rt305x"
KERNCONF_HINTS=		"RT3050F.hints"


KERNCONF_MAKEOPTIONS+=	"MIPS_LITTLE_ENDIAN=defined"


# XXX Maybe project definitions, maybe only board

#KERNCONF_MAKEOPTIONS+=	"INLINE_LIMIT=768"
KERNCONF_OPTIONS+=		MAXUSERS=3
KERNCONF_OPTIONS+=		MAXFILES=512
#KERNCONF_OPTIONS+=		NMBCLUSTERS=1024
#KERNCONF_OPTIONS+=		NSFBUFS=256
KERNCONF_OPTIONS+=		NSFBUFS=1024
KERNCONF_OPTIONS+=		SHMALL=128
KERNCONF_OPTIONS+=		MSGBUF_SIZE=65536

# Options for making kernel smallest 
KERNCONF_OPTIONS+=		NO_SYSCTL_DESCR
KERNCONF_OPTIONS+=		NO_FFS_SNAPSHOT
KERNCONF_OPTIONS+=		SCSI_NO_SENSE_STRINGS
KERNCONF_OPTIONS+=		SCSI_NO_OP_STRINGS
#KERNCONF_OPTIONS+=		MUTEX_NOINLINE
#KERNCONF_OPTIONS+=		RWLOCK_NOINLINE
#KERNCONF_OPTIONS+=		SX_NOINLINE
#KERNCONF_OPTIONS+=		NO_SWAPPING


# Don't build any modules yet.
#KERNCONF_MAKEOPTIONS+=	MODULES_OVERRIDE="wlan_xauth wlan_wep wlan_tkip wlan_acl wlan_amrr wlan_ccmp wlan_rssadapt random if_bridge bridgestp msdosfs md ipfw dummynet libalias geom/geom_label geom/geom_uzip ufs usb/uplcom usb/u3g usb/umodem usb/umass usb/ucom cam zlib"

# Debug definitions
##KERNCONF_MAKEOPTIONS+=	"DEBUG=-g"
KERNCONF_OPTIONS+=		DDB
KERNCONF_OPTIONS+=		KDB
KERNCONF_OPTIONS+=		PREEMPTION
##KERNCONF_OPTIONS+=		KTRACE
#KERNCONF_OPTIONS+=		LOCK_PROFILING
#KERNCONF_OPTIONS+=		KTR

# Board definitions
KERNCONF_OPTIONS+=	INET
KERNCONF_OPTIONS+= 	IPSTEALTH
#KERNCONF_OPTIONS+= 	TMPFS
KERNCONF_OPTIONS+= 	CD9660
#KERNCONF_OPTIONS+= 	GEOM_LABEL
KERNCONF_OPTIONS+= 	SCHED_ULE
#KERNCONF_OPTIONS+= 	SCHED_4BSD
#KERNCONF_OPTIONS+= 	NFSCLIENT
#KERNCONF_OPTIONS+= 	NFS_ROOT
KERNCONF_OPTIONS+= 	PSEUDOFS
KERNCONF_OPTIONS+=	_KPOSIX_PRIORITY_SCHEDULING

KERNCONF_NODEVICES+=	uart_ns8250

KERNCONF_DEVICES+=	loop
KERNCONF_DEVICES+=	pty
KERNCONF_DEVICES+=	ether
KERNCONF_DEVICES+=	bpf
KERNCONF_DEVICES+=	vlan
KERNCONF_DEVICES+=	uart
KERNCONF_DEVICES+=	tuntap

#KERNCONF_OPTIONS+=	IF_RT_DEBUG
#KERNCONF_OPTIONS+=	IF_RT_PHY_SUPPORT
#KERNCONF_OPTIONS+=	IF_RT_RING_DATA_COUNT=128
KERNCONF_DEVICES+=	rt
#KERNCONF_OPTIONS+=	RT2860_DEBUG
KERNCONF_DEVICES+=	miibus
KERNCONF_DEVICES+=	switch
KERNCONF_DEVICES+=	switch_obio
KERNCONF_DEVICES+=	switch_rt305x
.if !defined(WITHOUT_WIRELESS)
KERNCONF_DEVICES+=	rt2860
.endif
KERNCONF_DEVICES+=	wlan

KERNCONF_DEVICES+=	gpio
KERNCONF_DEVICES+=	gpioled

KERNCONF_DEVICES+=	cfi
KERNCONF_DEVICES+=	cfid

KERNCONF_DEVICES+=	nvram2env
KERNCONF_DEVICES+=	geom_map
KERNCONF_DEVICES+=	geom_uzip


KERNCONF_OPTIONS+=	SCSI_DELAY=1000

.if defined(WITH_IPSEC)
KERNCONF_OPTIONS+=         IPSEC

KERNCONF_DEVICES+=		enc
#KERNCONF_DEVICES+=		gif
KERNCONF_DEVICES+=		ipsec
KERNCONF_DEVICES+=		crypto
#KERNCONF_DEVICES+=		cryptodev	# /dev/crypto for access to h/w

##KERNCONF_DEVICES+=		rndtest		# FIPS 140-2 entropy tester
.endif


.if defined(WITH_USB)
#KERNCONF_OPTIONS+=		USB_EHCI_BIG_ENDIAN_DESC # XXX
#KERNCONF_OPTIONS+=		USB_DEBUG
#KERNCONF_OPTIONS+=		USB_VERBOSE
KERNCONF_DEVICES+=	usb			# USB Bus (required)
KERNCONF_DEVICES+=	dotg			# DWC like USB OTG Controller driver
.endif



