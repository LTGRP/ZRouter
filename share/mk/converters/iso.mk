CONVERT_FROM_ISO:=${NEW_CURRENT_PACKING_FILE_NAME}
CONVERT_TO_ISO:=${CURRENT_PACKING_FILE_NAME}

# Let user to override
CONVERTER_ISO?=makefs
CONVERTER_ISO_FLAGS?=-d 255 -t cd9660 -F ${CONVERT_FROM_ISO}.mtree -o "rockridge"

.if ${USE_SYSTEMTOOLS} == "yes"
_CONV_DEPEND=${CONVERT_FROM_ISO}
.else
_CONV_DEPEND=${CONVERT_FROM_ISO} ${ZTOOLS_PATH}/makefs
.endif

${CONVERT_TO_ISO}:		${_CONV_DEPEND}
	@echo -n "========== Convert ${CONVERT_FROM_ISO} to ${CONVERT_TO_ISO}"
	@echo " with ${CONVERTER_ISO} ============"
	PATH=${IMAGE_BUILD_PATHS} ${CONVERTER_ISO} ${CONVERTER_ISO_FLAGS} "${CONVERT_TO_ISO}" "${CONVERT_FROM_ISO}"
