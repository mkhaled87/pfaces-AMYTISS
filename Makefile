SUBDIRS = kernel

.PHONY: all clean

all: check-pfaces-sdk
	for dir in $(SUBDIRS); do $(MAKE) all -C $$dir $@; done

clean:
	rm -f ./kernel-pack/*.log
	rm -f ./kernel-pack/*.render
	rm -f ./kernel-pack/*.driver
	rm -f ./kernel-pack/*.dll
	rm -f ./kernel-pack/*.so
	rm -f ./kernel-pack/*.exp
	rm -f ./kernel-pack/*.ilk
	rm -f ./kernel-pack/*.lib
	rm -f ./kernel-pack/*.pdb
	find . -name "*.raw" -type f -delete
	for dir in $(SUBDIRS); do $(MAKE) clean -C $$dir $@; done


check-pfaces-sdk:
ifndef PFACES_SDK_ROOT
	$(error Are you sure you installed pFaces ? PFACES_SDK_ROOT is not defined.)
endif
	
