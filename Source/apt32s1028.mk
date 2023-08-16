##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=apt32s1028
ConfigurationName      :=BuildSet
WorkspacePath          :=./
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=luhy
Date                   :=16/08/2023
CDKPath                :=D:/C-Sky/CDK
ToolchainPath          :=D:/C-Sky/CDKRepo/Toolchain/CKV2ElfMinilib/V3.10.29/R/
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=Release_APT32F102_Tkey
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=apt32s1028.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck801  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/ckcpu.ld"
LinkOtherFlagsOption   := 
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch)D:/C-Sky/CDK/CSKY/csi/csi_core/csi_cdk/ $(IncludeSwitch)D:/C-Sky/CDK/CSKY/csi/csi_core/include/ $(IncludeSwitch)D:/C-Sky/CDK/CSKY/csi/csi_driver/include/ $(IncludeSwitch). $(IncludeSwitch)FreeRTOS $(IncludeSwitch)FreeRTOS/include $(IncludeSwitch)FreeRTOS/portable/CDK/E801 $(IncludeSwitch)FreeRTOS/portable/CDK/T-HEAD_CK802 $(IncludeSwitch)csi_core/include $(IncludeSwitch)include $(IncludeSwitch)FreeRTOS/ $(IncludeSwitch)FreeRTOS/include/ $(IncludeSwitch)FreeRTOS/portable/CDK/E801/ $(IncludeSwitch)FreeRTOS/portable/MemMang/ $(IncludeSwitch)csi_core/include/  
IncludeAPath           := $(IncludeSwitch)D:/C-Sky/CDK/CSKY/csi/csi_core/csi_cdk/ $(IncludeSwitch)D:/C-Sky/CDK/CSKY/csi/csi_core/include/ $(IncludeSwitch)D:/C-Sky/CDK/CSKY/csi/csi_driver/include/ $(IncludeSwitch). $(IncludeSwitch)FreeRTOS $(IncludeSwitch)FreeRTOS/include $(IncludeSwitch)FreeRTOS/portable/CDK/E801 $(IncludeSwitch)FreeRTOS/portable/CDK/T-HEAD_CK802 $(IncludeSwitch)csi_core/include  
Libs                   := -Wl,--start-group  -Wl,--end-group $(LibrarySwitch)_102ClkCalib_V3_20211213  
ArLibs                 := "lib_102ClkCalib_V3_20211213" 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch).  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck801   $(PreprocessorSwitch)CONFIG_CSKY_MMU=0   $(UnPreprocessorSwitch)__CSKY_ABIV2__  -Os  -g  -Wall  -ffunction-sections -mistack 
CFLAGS   := -mcpu=ck801   $(PreprocessorSwitch)CONFIG_CSKY_MMU=0   $(UnPreprocessorSwitch)__CSKY_ABIV2__  -Os  -g  -Wall  -ffunction-sections -mistack 
ASFLAGS  := -mcpu=ck801   $(PreprocessorSwitch)CONFIG_CKCPU_MMU=0   $(UnPreprocessorSwitch)__CSKY_ABIV2__  -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IntermediateDirectory)/arch_apt32s1028_iostring$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_adc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_bt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_coret$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_countera$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_crc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_ept$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_et$(ObjectSuffix) \
	$(IntermediateDirectory)/FWlib_apt32s1028_gpio$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_gpt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_hwdiv$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_i2c$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_ifc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_lpt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_rtc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_sio$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_spi$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_syscon$(ObjectSuffix) \
	$(IntermediateDirectory)/FWlib_apt32s1028_tkey_parameter$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_uart$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32s1028_wwdt$(ObjectSuffix) $(IntermediateDirectory)/apt32s1028_initial$(ObjectSuffix) $(IntermediateDirectory)/apt32s1028_interrupt$(ObjectSuffix) $(IntermediateDirectory)/main$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32s1028$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32s1028_ck801$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix) \
	$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix) $(IntermediateDirectory)/MemMang_heap_4$(ObjectSuffix) $(IntermediateDirectory)/E801_port$(ObjectSuffix) $(IntermediateDirectory)/E801_portasm$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) -Wl,--ckmap=$(ProjectPath)/Lst/$(OutputFile).map  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs) $(LinkOtherFlagsOption)
	-@mv $(ProjectPath)/Lst/$(OutputFile).map $(ProjectPath)/Lst/$(OutputFile).temp && $(READELF) $(ElfInfoSwitch) $(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix) > $(ProjectPath)/Lst/$(OutputFile).map && echo ====================================================================== >> $(ProjectPath)/Lst/$(OutputFile).map && cat $(ProjectPath)/Lst/$(OutputFile).temp >> $(ProjectPath)/Lst/$(OutputFile).map && rm -rf $(ProjectPath)/Lst/$(OutputFile).temp
	$(OBJCOPY) $(ObjcopySwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  $(ProjectPath)/Obj/$(OutputFile)$(IHexSuffix) 
	$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/arch_crt0$(ObjectSuffix): arch/crt0.S  
	$(AS) $(SourceSwitch) arch/crt0.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_crt0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/arch_crt0$(PreprocessSuffix): arch/crt0.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_crt0$(PreprocessSuffix) arch/crt0.S

$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix): arch/mem_init.c  
	$(CC) $(SourceSwitch) arch/mem_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_mem_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arch_mem_init$(PreprocessSuffix): arch/mem_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_mem_init$(PreprocessSuffix) arch/mem_init.c

$(IntermediateDirectory)/arch_apt32s1028_iostring$(ObjectSuffix): arch/apt32s1028_iostring.c  
	$(CC) $(SourceSwitch) arch/apt32s1028_iostring.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_apt32s1028_iostring$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_apt32s1028_iostring$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_apt32s1028_iostring$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arch_apt32s1028_iostring$(PreprocessSuffix): arch/apt32s1028_iostring.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_apt32s1028_iostring$(PreprocessSuffix) arch/apt32s1028_iostring.c

$(IntermediateDirectory)/FWlib_apt32s1028_adc$(ObjectSuffix): FWlib/apt32s1028_adc.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_adc$(PreprocessSuffix): FWlib/apt32s1028_adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_adc$(PreprocessSuffix) FWlib/apt32s1028_adc.c

$(IntermediateDirectory)/FWlib_apt32s1028_bt$(ObjectSuffix): FWlib/apt32s1028_bt.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_bt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_bt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_bt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_bt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_bt$(PreprocessSuffix): FWlib/apt32s1028_bt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_bt$(PreprocessSuffix) FWlib/apt32s1028_bt.c

$(IntermediateDirectory)/FWlib_apt32s1028_coret$(ObjectSuffix): FWlib/apt32s1028_coret.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_coret.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_coret$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_coret$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_coret$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_coret$(PreprocessSuffix): FWlib/apt32s1028_coret.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_coret$(PreprocessSuffix) FWlib/apt32s1028_coret.c

$(IntermediateDirectory)/FWlib_apt32s1028_countera$(ObjectSuffix): FWlib/apt32s1028_countera.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_countera.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_countera$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_countera$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_countera$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_countera$(PreprocessSuffix): FWlib/apt32s1028_countera.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_countera$(PreprocessSuffix) FWlib/apt32s1028_countera.c

$(IntermediateDirectory)/FWlib_apt32s1028_crc$(ObjectSuffix): FWlib/apt32s1028_crc.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_crc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_crc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_crc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_crc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_crc$(PreprocessSuffix): FWlib/apt32s1028_crc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_crc$(PreprocessSuffix) FWlib/apt32s1028_crc.c

$(IntermediateDirectory)/FWlib_apt32s1028_ept$(ObjectSuffix): FWlib/apt32s1028_ept.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_ept.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_ept$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_ept$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_ept$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_ept$(PreprocessSuffix): FWlib/apt32s1028_ept.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_ept$(PreprocessSuffix) FWlib/apt32s1028_ept.c

$(IntermediateDirectory)/FWlib_apt32s1028_et$(ObjectSuffix): FWlib/apt32s1028_et.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_et.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_et$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_et$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_et$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_et$(PreprocessSuffix): FWlib/apt32s1028_et.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_et$(PreprocessSuffix) FWlib/apt32s1028_et.c

$(IntermediateDirectory)/FWlib_apt32s1028_gpio$(ObjectSuffix): FWlib/apt32s1028_gpio.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_gpio$(PreprocessSuffix): FWlib/apt32s1028_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_gpio$(PreprocessSuffix) FWlib/apt32s1028_gpio.c

$(IntermediateDirectory)/FWlib_apt32s1028_gpt$(ObjectSuffix): FWlib/apt32s1028_gpt.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_gpt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_gpt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_gpt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_gpt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_gpt$(PreprocessSuffix): FWlib/apt32s1028_gpt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_gpt$(PreprocessSuffix) FWlib/apt32s1028_gpt.c

$(IntermediateDirectory)/FWlib_apt32s1028_hwdiv$(ObjectSuffix): FWlib/apt32s1028_hwdiv.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_hwdiv.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_hwdiv$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_hwdiv$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_hwdiv$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_hwdiv$(PreprocessSuffix): FWlib/apt32s1028_hwdiv.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_hwdiv$(PreprocessSuffix) FWlib/apt32s1028_hwdiv.c

$(IntermediateDirectory)/FWlib_apt32s1028_i2c$(ObjectSuffix): FWlib/apt32s1028_i2c.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_i2c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_i2c$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_i2c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_i2c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_i2c$(PreprocessSuffix): FWlib/apt32s1028_i2c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_i2c$(PreprocessSuffix) FWlib/apt32s1028_i2c.c

$(IntermediateDirectory)/FWlib_apt32s1028_ifc$(ObjectSuffix): FWlib/apt32s1028_ifc.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_ifc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_ifc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_ifc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_ifc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_ifc$(PreprocessSuffix): FWlib/apt32s1028_ifc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_ifc$(PreprocessSuffix) FWlib/apt32s1028_ifc.c

$(IntermediateDirectory)/FWlib_apt32s1028_lpt$(ObjectSuffix): FWlib/apt32s1028_lpt.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_lpt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_lpt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_lpt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_lpt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_lpt$(PreprocessSuffix): FWlib/apt32s1028_lpt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_lpt$(PreprocessSuffix) FWlib/apt32s1028_lpt.c

$(IntermediateDirectory)/FWlib_apt32s1028_rtc$(ObjectSuffix): FWlib/apt32s1028_rtc.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_rtc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_rtc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_rtc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_rtc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_rtc$(PreprocessSuffix): FWlib/apt32s1028_rtc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_rtc$(PreprocessSuffix) FWlib/apt32s1028_rtc.c

$(IntermediateDirectory)/FWlib_apt32s1028_sio$(ObjectSuffix): FWlib/apt32s1028_sio.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_sio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_sio$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_sio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_sio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_sio$(PreprocessSuffix): FWlib/apt32s1028_sio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_sio$(PreprocessSuffix) FWlib/apt32s1028_sio.c

$(IntermediateDirectory)/FWlib_apt32s1028_spi$(ObjectSuffix): FWlib/apt32s1028_spi.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_spi$(PreprocessSuffix): FWlib/apt32s1028_spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_spi$(PreprocessSuffix) FWlib/apt32s1028_spi.c

$(IntermediateDirectory)/FWlib_apt32s1028_syscon$(ObjectSuffix): FWlib/apt32s1028_syscon.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_syscon.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_syscon$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_syscon$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_syscon$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_syscon$(PreprocessSuffix): FWlib/apt32s1028_syscon.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_syscon$(PreprocessSuffix) FWlib/apt32s1028_syscon.c

$(IntermediateDirectory)/FWlib_apt32s1028_tkey_parameter$(ObjectSuffix): FWlib/apt32s1028_tkey_parameter.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_tkey_parameter.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_tkey_parameter$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_tkey_parameter$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_tkey_parameter$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_tkey_parameter$(PreprocessSuffix): FWlib/apt32s1028_tkey_parameter.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_tkey_parameter$(PreprocessSuffix) FWlib/apt32s1028_tkey_parameter.c

$(IntermediateDirectory)/FWlib_apt32s1028_uart$(ObjectSuffix): FWlib/apt32s1028_uart.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_uart$(PreprocessSuffix): FWlib/apt32s1028_uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_uart$(PreprocessSuffix) FWlib/apt32s1028_uart.c

$(IntermediateDirectory)/FWlib_apt32s1028_wwdt$(ObjectSuffix): FWlib/apt32s1028_wwdt.c  
	$(CC) $(SourceSwitch) FWlib/apt32s1028_wwdt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32s1028_wwdt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32s1028_wwdt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32s1028_wwdt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32s1028_wwdt$(PreprocessSuffix): FWlib/apt32s1028_wwdt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32s1028_wwdt$(PreprocessSuffix) FWlib/apt32s1028_wwdt.c

$(IntermediateDirectory)/apt32s1028_initial$(ObjectSuffix): apt32s1028_initial.c  
	$(CC) $(SourceSwitch) apt32s1028_initial.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32s1028_initial$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32s1028_initial$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32s1028_initial$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32s1028_initial$(PreprocessSuffix): apt32s1028_initial.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32s1028_initial$(PreprocessSuffix) apt32s1028_initial.c

$(IntermediateDirectory)/apt32s1028_interrupt$(ObjectSuffix): apt32s1028_interrupt.c  
	$(CC) $(SourceSwitch) apt32s1028_interrupt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32s1028_interrupt$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32s1028_interrupt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32s1028_interrupt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32s1028_interrupt$(PreprocessSuffix): apt32s1028_interrupt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32s1028_interrupt$(PreprocessSuffix) apt32s1028_interrupt.c

$(IntermediateDirectory)/main$(ObjectSuffix): main.c  
	$(CC) $(SourceSwitch) main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/main$(ObjectSuffix) -MF$(IntermediateDirectory)/main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/main$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main$(PreprocessSuffix) main.c

$(IntermediateDirectory)/drivers_apt32s1028$(ObjectSuffix): drivers/apt32s1028.c  
	$(CC) $(SourceSwitch) drivers/apt32s1028.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32s1028$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32s1028$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32s1028$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32s1028$(PreprocessSuffix): drivers/apt32s1028.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32s1028$(PreprocessSuffix) drivers/apt32s1028.c

$(IntermediateDirectory)/drivers_apt32s1028_ck801$(ObjectSuffix): drivers/apt32s1028_ck801.c  
	$(CC) $(SourceSwitch) drivers/apt32s1028_ck801.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32s1028_ck801$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32s1028_ck801$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32s1028_ck801$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32s1028_ck801$(PreprocessSuffix): drivers/apt32s1028_ck801.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32s1028_ck801$(PreprocessSuffix) drivers/apt32s1028_ck801.c

$(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix): FreeRTOS/croutine.c  
	$(CC) $(SourceSwitch) FreeRTOS/croutine.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_croutine$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_croutine$(PreprocessSuffix): FreeRTOS/croutine.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_croutine$(PreprocessSuffix) FreeRTOS/croutine.c

$(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix): FreeRTOS/event_groups.c  
	$(CC) $(SourceSwitch) FreeRTOS/event_groups.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_event_groups$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_event_groups$(PreprocessSuffix): FreeRTOS/event_groups.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_event_groups$(PreprocessSuffix) FreeRTOS/event_groups.c

$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix): FreeRTOS/list.c  
	$(CC) $(SourceSwitch) FreeRTOS/list.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_list$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_list$(PreprocessSuffix): FreeRTOS/list.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_list$(PreprocessSuffix) FreeRTOS/list.c

$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix): FreeRTOS/queue.c  
	$(CC) $(SourceSwitch) FreeRTOS/queue.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_queue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_queue$(PreprocessSuffix): FreeRTOS/queue.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_queue$(PreprocessSuffix) FreeRTOS/queue.c

$(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix): FreeRTOS/tasks.c  
	$(CC) $(SourceSwitch) FreeRTOS/tasks.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_tasks$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_tasks$(PreprocessSuffix): FreeRTOS/tasks.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_tasks$(PreprocessSuffix) FreeRTOS/tasks.c

$(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix): FreeRTOS/timers.c  
	$(CC) $(SourceSwitch) FreeRTOS/timers.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_timers$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_timers$(PreprocessSuffix): FreeRTOS/timers.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_timers$(PreprocessSuffix) FreeRTOS/timers.c

$(IntermediateDirectory)/MemMang_heap_4$(ObjectSuffix): FreeRTOS/portable/MemMang/heap_4.c  
	$(CC) $(SourceSwitch) FreeRTOS/portable/MemMang/heap_4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/MemMang_heap_4$(ObjectSuffix) -MF$(IntermediateDirectory)/MemMang_heap_4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/MemMang_heap_4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/MemMang_heap_4$(PreprocessSuffix): FreeRTOS/portable/MemMang/heap_4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/MemMang_heap_4$(PreprocessSuffix) FreeRTOS/portable/MemMang/heap_4.c

$(IntermediateDirectory)/E801_port$(ObjectSuffix): FreeRTOS/portable/CDK/E801/port.c  
	$(CC) $(SourceSwitch) FreeRTOS/portable/CDK/E801/port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/E801_port$(ObjectSuffix) -MF$(IntermediateDirectory)/E801_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/E801_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/E801_port$(PreprocessSuffix): FreeRTOS/portable/CDK/E801/port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/E801_port$(PreprocessSuffix) FreeRTOS/portable/CDK/E801/port.c

$(IntermediateDirectory)/E801_portasm$(ObjectSuffix): FreeRTOS/portable/CDK/E801/portasm.S  
	$(AS) $(SourceSwitch) FreeRTOS/portable/CDK/E801/portasm.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/E801_portasm$(ObjectSuffix) -MF$(IntermediateDirectory)/E801_portasm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/E801_portasm$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/E801_portasm$(PreprocessSuffix): FreeRTOS/portable/CDK/E801/portasm.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/E801_portasm$(PreprocessSuffix) FreeRTOS/portable/CDK/E801/portasm.S


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S

-include $(IntermediateDirectory)/*$(DependSuffix)
