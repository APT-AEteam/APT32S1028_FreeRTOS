.PHONY: clean All Project_Title Project_Build

All: Project_Title Project_Build

Project_Title:
	@echo "----------Building project:[ apt32s1028 - BuildSet ]----------"

Project_Build:
	@make -r -f apt32s1028.mk -j 12 -C  ./ 


clean:
	@echo "----------Cleaning project:[ apt32s1028 - BuildSet ]----------"

