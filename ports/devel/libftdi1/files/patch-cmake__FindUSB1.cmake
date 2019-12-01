--- cmake/FindUSB1.cmake.orig	2014-08-02 12:05:59.000000000 +0200
+++ cmake/FindUSB1.cmake	2014-08-02 12:06:34.000000000 +0200
@@ -26,7 +26,7 @@
     PATH_SUFFIXES libusb-1.0
     PATHS ${PC_LIBUSB_INCLUDEDIR} ${PC_LIBUSB_INCLUDE_DIRS})

-  FIND_LIBRARY(LIBUSB_LIBRARIES NAMES usb-1.0
+  FIND_LIBRARY(LIBUSB_LIBRARIES NAMES usb-1.0 usb
     PATHS ${PC_LIBUSB_LIBDIR} ${PC_LIBUSB_LIBRARY_DIRS})

   include(FindPackageHandleStandardArgs)