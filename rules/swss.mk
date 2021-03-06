# swss package

SWSS = swss_1.0.0_amd64.deb
$(SWSS)_SRC_PATH = $(SRC_PATH)/sonic-swss
$(SWSS)_DEPENDS += $(LIBSAIREDIS_DEV) $(LIBSAIMETADATA_DEV) $(LIBTEAM_DEV) \
    $(LIBTEAMDCT) $(LIBTEAM_UTILS)
$(SWSS)_RDEPENDS += $(LIBSAIREDIS) $(LIBSAIMETADATA) $(LIBTEAM)
SONIC_DPKG_DEBS += $(SWSS)

SWSS_DBG = swss-dbg_1.0.0_amd64.deb
$(SWSS_DBG)_DEPENDS += $(SWSS)
$(SWSS_DBG)_RDEPENDS += $(SWSS)
$(eval $(call add_derived_package,$(SWSS),$(SWSS_DBG)))
