TOP=../..

include $(TOP)/configure/CONFIG
# =======================================
#  ADD MACRO DEFINITIONS BELOW HERE
# =======================================

#======================================================
# Path to "NON EPICS" External PACKAGES: USER INCLUDES
#======================================================

# Support Perl C regular expression library
USR_INCLUDES += -I$(PCRE_INCLUDE)
#=====================================================


#======================================================
# PATH TO "NON EPICS" EXTERNAL PACKAGES: USER LIBRARIES
#======================================================
pcre_DIR = $(PCRE_LIB)
#=====================================================

#======================================================
# LINK "NON EPICS" EXTERNAL PACKAGE LIBRARIES STATICALLY
#=======================================================
USR_LIBS_Linux += pcre


# =======================================
# Build the IOC application
# =======================================
PROD_IOC = rfOvrFiberTemp

# rfOvrFiberTemp.dbd will be created and installed
DBD += rfOvrFiberTemp.dbd

# rfOvrFiberTemp.dbd will include these files:
rfOvrFiberTemp_DBD += base.dbd
rfOvrFiberTemp_DBD += iocAdmin.dbd
rfOvrFiberTemp_DBD += asSupport.dbd
rfOvrFiberTemp_DBD += asyn.dbd
rfOvrFiberTemp_DBD += stream.dbd
rfOvrFiberTemp_DBD += caPutLog.dbd

# rfOvrFiberTemp_registerRecordDeviceDriver.cpp derives from rfOvrFiberTemp.dbd
rfOvrFiberTemp_SRCS += rfOvrFiberTemp_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
rfOvrFiberTemp_SRCS_DEFAULT += rfOvrFiberTempMain.cpp
rfOvrFiberTemp_SRCS_vxWorks += -nil-

# =====================================================
# Link in the libraries from other EPICS modules
# =====================================================
rfOvrFiberTemp_LIBS += devIocStats
rfOvrFiberTemp_LIBS += autosave
rfOvrFiberTemp_LIBS += caPutLog
rfOvrFiberTemp_LIBS += stream
rfOvrFiberTemp_LIBS += asyn
# =====================================================



# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into rfOvrFiberTemp
    sncExample_SNCFLAGS += +r
    rfOvrFiberTemp_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    rfOvrFiberTemp_SRCS += sncExample.stt
    rfOvrFiberTemp_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    rfOvrFiberTemp_LIBS += qsrv
    rfOvrFiberTemp_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    rfOvrFiberTemp_DBD += PVAServerRegister.dbd
    rfOvrFiberTemp_DBD += qsrv.dbd
endif

# ================================================
# Finally link IOC to the EPICS Base libraries
# ================================================
rfOvrFiberTemp_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE
