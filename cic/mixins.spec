[main]
mixinsdir: device/intel/mixins
mixinsctl: true
mixinsrel: false

[mapping]
product.mk: device.mk

[groups]
boot-arch: project-celadon(uefi_arch=x86_64,use_cic=true)
allow-missing-dependencies: true
sepolicy: enforcing
loop-mount: true
audio: aic
cpu-arch: x86_64
debug-unresponsive: false
dexpreopt: true
device-specific: cic(file_encryption=true,dm_verity=true)
ais: true
graphics: aic_mdc
usb: acc
wlan: cic
houdini: true
usb-gadget: cic-configfs
media: mesa(add_sw_msdk=false, opensource_msdk=true)
codecs: configurable(hw_ve_h265=true, hw_vd_vp9=true, hw_vd_mp2=true, hw_vd_vc1=false, platform=bxt,profile_file=media_profiles_1080p.xml)
codec2: true
camera-ext: ext-camera-only
bluetooth: cic
storage: sdcard-mmc0-usb-sd(adoptablesd=false,adoptableusb=false)
