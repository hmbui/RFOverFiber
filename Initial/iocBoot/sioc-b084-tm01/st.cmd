#!../../bin/rhel6-x86_64/rfOvrFiberTemp

#- You may have to change rfOvrFiberTemp to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/rfOvrFiberTemp.dbd"
rfOvrFiberTemp_registerRecordDeviceDriver pdbbase

# -----------------------------------------------------------------
# Configuration/Initialization for the SRS Programmable Temperature
# Controller 10 (PTC10)
#------------------------------------------------------------------

#drvAsynIPPortConfigure("PTC_ETH","164.54.109.50:23", 0, 0, 0)

# Show communication
#!asynSetTraceMask("PTC_ETH", 0, 3)

# Only show errors
#asynSetTraceMask("PTC_ETH", 0, 1)

# Leave ascii selected so traces can be turned on with a single click
#asynSetTraceIOMask("PTC_ETH", 0, 1)

# Set end-of-string terminators
#asynOctetSetInputEos("PTC_ETH",0,"\r\n")
#asynOctetSetOutputEos("PTC_ETH",0,"\r")

# Location of stream protocol files
#-------------------------------------------------------------------
epicsEnvSet "STREAM_PROTOCOL_PATH", "$(TOP)/db"
#-------------------------------------------------------------------

## Load record instances
dbLoadTemplate("db/user.substitutions")
dbLoadTemplate("db/PTC10_all.substitutions")
dbLoadRecords("db/asynRecord.db","P=HAI:,R=tc1:asyn,PORT=PTC_ETH,ADDR=0,OMAX=0,IMAX=0")

#- Set this to see messages from mySub
#var mySubDebug 1

#- Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=hbui"
