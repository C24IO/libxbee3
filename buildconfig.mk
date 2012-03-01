### libxbee internal build configuration options:
### it is recommended that you DO NOT change this file

BUILDDIR:=      .build
DESTDIR:=       lib
MANDIR:=        man

LIBFULLREV:=    $(LIBMAJ).$(LIBMIN).$(LIBREV)

SYS_MANPAGES:=  $(subst $(MANDIR)/,,$(SYS_MANPAGES))

AR:=            $(CROSS_COMPILE)ar
LD:=            $(CROSS_COMPILE)ld
GCC:=           $(CROSS_COMPILE)gcc
OBJCOPY:=       $(CROSS_COMPILE)objcopy
GZIP:=          gzip
MAKE+=          --no-print-directory

DEBUG:=         -g
CFLAGS+=        -Wall -Wstrict-prototypes -Wno-variadic-macros -c -fPIC $(DEBUG) $(addprefix -D,$(OPTIONS))
CFLAGS+=        -fvisibility=hidden
#CFLAGS+=       -pedantic
CLINKS+=        $(addprefix -l,$(LIBS)) $(DEBUG)

COMMA:=         ,
.PRECIOUS: .%.dir $(BUILDDIR)/%.d
