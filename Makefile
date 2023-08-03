#
# A Makefile that compiles all .c and .s files in "src" and "res" 
# subdirectories and places the output in a "obj" subdirectory
#

# If you move this project you can change the directory 
# to match your GBDK root directory (ex: GBDK_HOME = "C:/GBDK/"
#GBDK_HOME = ../../../

LCC = $(GBDK_HOME)/bin/lcc 

# You can set flags for LCC here
# For example, you can uncomment the line below to turn on debug output
LCCFLAGS = -debug -Wp--Werror -Wp--vc -Wa-l -Wf--debug -Wl-w -Wl-m -Wl-y -Wi-e
LCCCOLORFLAGS = -Wm-yc
#useful : -v -debug -g -Wp--Werror -Wa-l -Wf--debug -Wl-w -Wl-m -Wl-j -Wl-y -Wi-e -Wm-yc -Wm-yC -Wl-yt0x1B

# You can set the name of the .gb ROM file here
PROJECTNAME    = Example

SRCDIR      = src
OBJDIR      = obj
RESDIR      = res
ROMDIR		= rom
BINS	    = $(OBJDIR)/$(PROJECTNAME).gb
CSOURCES    = $(foreach dir,$(SRCDIR),$(notdir $(wildcard $(dir)/*.c))) $(foreach dir,$(RESDIR),$(notdir $(wildcard $(dir)/*.c)))
ASMSOURCES  = $(foreach dir,$(SRCDIR),$(notdir $(wildcard $(dir)/*.s)))
OBJS       = $(CSOURCES:%.c=$(OBJDIR)/%.o) $(ASMSOURCES:%.s=$(OBJDIR)/%.o)

all: prepare $(BINS) copy

compile.bat: Makefile
	@echo "REM Automatically generated from Makefile" > compile.bat
	@make -sn | sed y/\\//\\\\/ | grep -v make >> compile.bat

# Compile .c files in "src/" to .o object files
$(OBJDIR)/%.o:	$(SRCDIR)/%.c
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Compile .c files in "res/" to .o object files
$(OBJDIR)/%.o:	$(RESDIR)/%.c
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Compile .s assembly files in "src/" to .o object files
$(OBJDIR)/%.o:	$(SRCDIR)/%.s
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# If needed, compile .c files in "src/" to .s assembly files
# (not required if .c is compiled directly to .o)
$(OBJDIR)/%.s:	$(SRCDIR)/%.c
	$(LCC) $(LCCFLAGS) -S -o $@ $<

# Link the compiled object files into a .gb ROM file
$(BINS):	$(OBJS)
	$(LCC) $(LCCFLAGS) $(LCCCOLORFLAGS) -o $(BINS) $(OBJS)

prepare:
#echo mkdir -p $(OBJDIR)

copy:
#copy rom to rom dir
	cp $(OBJDIR)/$(PROJECTNAME).gb* $(ROMDIR)

clean:
#	"rm" -f  *.gb *.ihx *.cdb *.adb *.noi *.map
	"rm" -f  $(OBJDIR)/*.*

