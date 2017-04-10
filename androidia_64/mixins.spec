[main]
mixinsdir: device/intel/mixins/groups

[mapping]
product.mk: device.mk

[groups]
android_ia: default
sepolicy: enforcing
graphics: android_ia(gen9+=true,hwc2=true,vulkan=true,drmhwc=false,minigbm=true)
media: android_ia
device-type: tablet
ethernet: dhcp
debugfs: default
storage: sdcard-mmc0-usb-sd(adoptablesd=true,adoptableusb=false)
display-density: default
usb-gadget: g_ffs
adb_net: true
kernel: android_ia
bluetooth: btusb
boot-arch: android_ia(bootloader_policy=0x0,bootloader_len=60)
audio: android_ia
wlan: iwlwifi
cpu-arch: skl
cpuset: 4cores
rfkill: true(force_disable=)
dexpreopt: enabled
disk-bus: auto
usb: host+acc
lights: true
thermal: dptf(intel_modem=true)
config-partition: enabled
vendor-partition: true(partition_size=1500,partition_name=android_vendor)
factory-partition: true
debug-crashlogd: true
debug-logs: true
debug-phonedoctor: true
debug-tools: true
flashfiles: ini(oemvars=false,version=3.0,fastboot_min_battery_level=3500,installer=true)
