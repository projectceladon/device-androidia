[main]
mixinsdir: device/intel/mixins/groups

[mapping]
product.mk: device.mk

[groups]
2ndstage: oemvars
project-celadon: default
sepolicy: enforcing
graphics: project-celadon(gen9+=true,hwc2=true,vulkan=false,drmhwc=false,minigbm=true,gralloc1=true)
media: project-celadon(mediasdk=false,media_sdk_source=false)
device-type: car
ethernet: dhcp
debugfs: default
storage: sdcard-mmc0-usb-sd(adoptablesd=true,adoptableusb=false)
display-density: default
usb-gadget: g_ffs
adb_net: true
kernel: project-celadon(loglevel=3, disable_cpuidle_on_boot=true)
bluetooth: btusb (ivi=true)
boot-arch: project-celadon(bootloader_policy=0x0,bootloader_len=60,magic_key_timeout=80,assume_bios_secure_boot=true,tos_partition=true,rpmb_simulate=true,disk_encryption=false,file_encryption=true)
audio: project-celadon
wlan: iwlwifi
cpu-arch: skl
cpuset: autocores
rfkill: true(force_disable=)
dexpreopt: enabled
disk-bus: auto
usb: host+acc
lights: true
thermal: dptf(intel_modem=true)
config-partition: enabled
vendor-partition: true
factory-partition: true
debug-crashlogd: true
debug-logs: true
debug-coredump: true
debug-phonedoctor: true
debug-tools: true
flashfiles: ini(oemvars=false,version=3.0,fastboot_min_battery_level=3500,installer=true)
midi: true
trusty: true(ref_target=project-celadon_64)
slcan: default
ioc-slcan-reboot: false
camera: usbcamera
memtrack: true
touch: galax7200
avb: true
slot-ab: true
