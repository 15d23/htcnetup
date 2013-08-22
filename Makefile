# Makefile
# LuoXiaoqiu <qilvilu@gmail.com>

all: htcnetup

CC=gcc

INSTDIR = /usr/local/bin

htcnetup : htcnetup.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean :
	rm -rf htcnetup

install:htcnetup
@if [ -d $(INSTDIR) ]; \
then \
cp htcnetup $(INSTDIR);\
cp htcnet.sh $(INSTDIR);\
cp 49-htcpnet.rules /etc/udev/rules.d;\
chmod a+x $(INSTDIR)/htcnetup;\
chmod a+x $(INSTDIR)/htcnet.sh;\
echo “Installed in $(INSTDIR)“;\
else \
echo “Sorry, $(INSTDIR) does not exist”;\
fi
