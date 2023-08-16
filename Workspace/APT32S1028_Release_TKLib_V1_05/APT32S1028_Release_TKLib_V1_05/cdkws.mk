.PHONY: clean All Project_Title Project_Build

All: Project_Title Project_Build

Project_Title:
	@echo "----------Building project:[ apt32s1028 - BuildSet ]----------"

Project_Build:
	@make -r -f apt32s1028.mk -j 4 -C  E:/OneDrive/APT/APT_MCU_IC/Demo_code/APT32F102/APT32S1028_Release_V1_09_20230105/Source 


clean:
	@echo "----------Cleaning project:[ apt32s1028 - BuildSet ]----------"

