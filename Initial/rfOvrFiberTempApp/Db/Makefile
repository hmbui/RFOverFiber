TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Install databases, templates & substitutions like this
DB += PTC10.db
DB += PTC10_aio_chan.db
DB += PTC10_tc_chan.db
DB += dbExample1.db
DB += dbExample2.db
DB += user.substitutions
#DB += PTC10_all.db
DB += PTC10_all.substitutions
PROTO += PTC10.proto

# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_TEMPLATE = <templatename>

# Install Common databases needed by All IOCs
# ========================================================
# Install databases from iocAdmin package
# These databases support IOC Health and Monitoring
# ========================================================
# SoftIOC
DB_INSTALLS += $(IOCADMIN)/db/iocAdminSoft.db

DB_INSTALLS += $(IOCADMIN)/db/iocAdminScanMon.db
DB_INSTALLS += $(IOCADMIN)/db/iocScanMonSum.db
DB_INSTALLS += $(IOCADMIN)/db/iocScanMon.db
IOCRELEASE_DB += iocRelease.db

DB_INSTALLS += $(ASYN)/db/asynRecord.db
# Install Database to support reading the status of the autosave package:
DB_INSTALLS += $(AUTOSAVE)/db/save_restoreStatus.db

# # =======================================================================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

