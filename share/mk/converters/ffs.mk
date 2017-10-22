CONVERT_FROM_FFS:=${NEW_CURRENT_PACKING_FILE_NAME}
CONVERT_TO_FFS:=${CURRENT_PACKING_FILE_NAME}

# Let user to override
CONVERTER_FFS?=makefs
CONVERTER_FFS_FLAGS?=-t ffs -d 255 -F ${ROOTFS_CLEAN_MTREE_FILE} \
    -s ${ROOTFS_MEDIA_SIZE} -o minfree=0,version=1 ${ROOTFS_ENDIAN_FLAGS}

.if ${USE_SYSTEMTOOLS} == "yes"
_CONV_DEPEND=${CONVERT_FROM_FFS}
.else
_CONV_DEPEND=${CONVERT_FROM_FFS} ${ZTOOLS_PATH}/makefs
.endif

${CONVERT_TO_FFS}:		${_CONV_DEPEND}
	@echo -n "========== Convert ${CONVERT_FROM_FFS} to ${CONVERT_TO_FFS}"
	@echo " with ${CONVERTER_FFS} ============"
	PATH=${IMAGE_BUILD_PATHS} ${CONVERTER_FFS} ${CONVERTER_FFS_FLAGS} \
	    "${CONVERT_TO_FFS}" "${CONVERT_FROM_FFS}"
