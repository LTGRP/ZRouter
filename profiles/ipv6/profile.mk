
IPV6_ENABLE=yes
KERNCONF_OPTIONS+=      INET6
WORLD_BUILD_ENV_EXTRA+=	WITH_INET6=yes

#KERNCONF_DEVICES+=gif
KERNCONF_MODULES_OVERRIDE+=if_gif

WORLD_SUBDIRS_SBIN+=ping6
WORLD_SUBDIRS_USR_SBIN+=ip6addrctl



