WINEBUILD_BASE = tools$(SEP)winebuild

WINEBUILD_BASE_DIR = $(INTERMEDIATE)$(WINEBUILD_BASE)

$(WINEBUILD_BASE_DIR): $(INTERMEDIATE_NO_SLASH) $(RMKDIR_TARGET)
	${mkdir} $(INTERMEDIATE)$(WINEBUILD_BASE)

WINEBUILD_TARGET = \
	$(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)winebuild$(EXEPOSTFIX)

WINEBUILD_SOURCES = \
	$(WINEBUILD_BASE)$(SEP)import.c \
	$(WINEBUILD_BASE)$(SEP)main.c \
	$(WINEBUILD_BASE)$(SEP)parser.c \
	$(WINEBUILD_BASE)$(SEP)res16.c \
	$(WINEBUILD_BASE)$(SEP)res32.c \
	$(WINEBUILD_BASE)$(SEP)spec32.c \
	$(WINEBUILD_BASE)$(SEP)utils.c \
	$(WINEBUILD_BASE)$(SEP)mkstemps.c

WINEBUILD_OBJECTS = \
  $(addprefix $(INTERMEDIATE), $(WINEBUILD_SOURCES:.c=.o))

WINEBUILD_HOST_CFLAGS = -D__USE_W32API -Iinclude/wine

WINEBUILD_HOST_LFLAGS = -g

$(WINEBUILD_TARGET): $(WINEBUILD_BASE_DIR) $(WINEBUILD_OBJECTS)
	$(ECHO_LD)
	${host_gcc} $(WINEBUILD_OBJECTS) $(WINEBUILD_HOST_LFLAGS) -o $(WINEBUILD_TARGET)

$(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)import.o: $(WINEBUILD_BASE_DIR) $(WINEBUILD_BASE)$(SEP)import.c
	$(ECHO_CC)
	${host_gcc} $(WINEBUILD_HOST_CFLAGS) -c $(WINEBUILD_BASE)$(SEP)import.c -o $(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)import.o

$(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)main.o: $(WINEBUILD_BASE_DIR) $(WINEBUILD_BASE)$(SEP)main.c
	$(ECHO_CC)
	${host_gcc} $(WINEBUILD_HOST_CFLAGS) -c $(WINEBUILD_BASE)$(SEP)main.c -o $(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)main.o

$(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)parser.o: $(WINEBUILD_BASE_DIR) $(WINEBUILD_BASE)$(SEP)parser.c
	$(ECHO_CC)
	${host_gcc} $(WINEBUILD_HOST_CFLAGS) -c $(WINEBUILD_BASE)$(SEP)parser.c -o $(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)parser.o

$(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)res16.o: $(WINEBUILD_BASE_DIR) $(WINEBUILD_BASE)$(SEP)res16.c
	$(ECHO_CC)
	${host_gcc} $(WINEBUILD_HOST_CFLAGS) -c $(WINEBUILD_BASE)$(SEP)res16.c -o $(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)res16.o

$(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)res32.o: $(WINEBUILD_BASE_DIR) $(WINEBUILD_BASE)$(SEP)res32.c
	$(ECHO_CC)
	${host_gcc} $(WINEBUILD_HOST_CFLAGS) -c $(WINEBUILD_BASE)$(SEP)res32.c -o $(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)res32.o

$(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)spec32.o: $(WINEBUILD_BASE_DIR) $(WINEBUILD_BASE)$(SEP)spec32.c
	$(ECHO_CC)
	${host_gcc} $(WINEBUILD_HOST_CFLAGS) -c $(WINEBUILD_BASE)$(SEP)spec32.c -o $(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)spec32.o

$(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)utils.o: $(WINEBUILD_BASE_DIR) $(WINEBUILD_BASE)$(SEP)utils.c
	$(ECHO_CC)
	${host_gcc} $(WINEBUILD_HOST_CFLAGS) -c $(WINEBUILD_BASE)$(SEP)utils.c -o $(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)utils.o

$(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)mkstemps.o: $(WINEBUILD_BASE_DIR) $(WINEBUILD_BASE)$(SEP)mkstemps.c
	$(ECHO_CC)
	${host_gcc} $(WINEBUILD_HOST_CFLAGS) -c $(WINEBUILD_BASE)$(SEP)mkstemps.c -o $(INTERMEDIATE)$(WINEBUILD_BASE)$(SEP)mkstemps.o

.PHONY: winebuild_clean
winebuild_clean:
	-@$(rm) $(WINEBUILD_TARGET) $(WINEBUILD_OBJECTS) 2>$(NUL)
clean: winebuild_clean
