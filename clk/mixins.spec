[main]
mixinsdir: device/intel/mixins/groups

[mapping]
product.mk: device.mk

[groups]
device-specific: clk
treble: true
vndk: true
2ndstage: oemvars
project-celadon: default
sepolicy: enforcing
graphics: mesa(gralloc1=true,gen9+=true,hwc2=true,vulkan=true,drmhwc=false,minigbm=true)
media: project-celadon(mediasdk=false,media_sdk_source=false,profile_file=media_profiles_1080p.xml)
device-type: tablet
ethernet: dhcp
debugfs: default
storage: sdcard-mmcblk1(adoptablesd=false,adoptableusb=true)
display-density: default
usb-gadget: g_ffs
adb_net: true
kernel: project-celadon(loglevel=3, disable_cpuidle_on_boot=true, external_modules=perftools-external/soc_perf_driver/src perftools-external/socwatch_driver)
bluetooth: btusb
boot-arch: project-celadon(bootloader_policy=0x0,bootloader_len=60,magic_key_timeout=80,assume_bios_secure_boot=true,rpmb_simulate=true,disk_encryption=false,file_encryption=true,ignore_not_applicable_reset=true,self_usb_device_mode_protocol=true,system_partition_size=3584)
audio: project-celadon
wlan: iwlwifi
cpu-arch: skl
cpuset: autocores
rfkill: true(force_disable=)
dexpreopt: enabled
disk-bus: auto
usb: host+acc
lights: true
thermal: thermal-daemon
config-partition: true
vendor-partition: true
factory-partition: true
pstore: ram_dummy(address=0x50000000,size=0x400000,record_size=0x4000,console_size=0x200000,ftrace_size=0x2000,dump_oops=1)
debug-crashlogd: true
debug-logs: true
debug-coredump: true
debug-phonedoctor: true
debug-tools: true
flashfiles: ini(oemvars=false,version=3.0,fastboot_min_battery_level=false,installer=true,timeout=7200000)
midi: true
trusty: true(ref_target=celadon_clk)
slcan: default
ioc-slcan-reboot: false
camera-ext: ext-camera-only
memtrack: true
touch: galax7200
avb: true
health: true
slot-ab: true
art-config: default
gptbuild: true(size=14G,generate_craff=false)
swap:zram(size=1073741824,swappiness=false,hardware=celadon)
power: true
firststage-mount: true
serialport: ttyS2
default-drm: true
