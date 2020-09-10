[main]
mixinsdir: ./mixins/groups
mixinsctl: true
mixinsrel: false

[mapping]
product.mk: device.mk

[groups]
kernel: gmin64(useprebuilt=false,src_path=kernel/lts2019-chromium, loglevel=7, no_console_suspend=1, interactive_governor=false, relative_sleepstates=false, modules_in_bootimg=false, external_modules=,debug_modules=, use_bcmdhd=false, use_iwlwifi=false, extmod_platform=bxt, iwl_defconfig=, cfg_path=config-lts/lts2019-chromium, more_modules=true, yocto_src_path=kernel/lts2019-yocto, yocto_cfg_path=config-lts/lts2019-yocto, chromium_src_path=kernel/lts2019-chromium, chromium_cfg_path=config-lts/lts2019-chromium)
disk-bus: auto
boot-arch: project-celadon(uefi_arch=x86_64,fastboot=efi,ignore_rsci=true,disable_watchdog=true,watchdog_parameters=10 30,verity_warning=false,txe_bind_root_of_trust=false,bootloader_block_size=4096,verity_mode=false,disk_encryption=false,file_encryption=true,target=caas,ignore_not_applicable_reset=true,self_usb_device_mode_protocol=true,usb_storage=true,live_boot=true)
sepolicy: permissive
bluetooth: btusb
audio: project-celadon
vendor-partition: true(partition_size=600,partition_name=vendor)
acpio-partition: true(partition_size=2)
config-partition: true
product-partition: true
odm-partition: true
display-density: medium
dalvik-heap: tablet-10in-xhdpi-2048
cpu-arch: x86
allow-missing-dependencies: true
dexpreopt: true
pstore: false
media: auto(add_sw_msdk=false, opensource_msdk=true, opensource_msdk_omx_il=true)
graphics: auto(gen9+=true,hwc2=false,vulkan=true,drmhwc=true,minigbm=true,gralloc1=true,enable_guc=false)
storage: sdcard-mmc0-v-usb-sd(adoptablesd=false,adoptableusb=false)
ethernet: dhcp
camera-ext: false
rfkill: true(force_disable=)
wlan: auto
codecs: configurable(hw_ve_h265=true, hw_vd_vp9=true, hw_vd_mp2=true, hw_vd_vc1=false, platform=bxt, profile_file=media_profiles_1080p.xml)
codec2: true
usb: host
usb-gadget: auto(usb_config=adb,mtp_adb_pid=0x0a5f,ptp_adb_pid=0x0a61,rndis_pid=0x0a62,rndis_adb_pid=0x0a63,bcdDevice=0x0,bcdUSB=0x200,controller=dwc3.2.auto,f_acm=false,f_dvc_trace=true,dvctrace_source_dev=dvcith-0-msc0)
midi: true
touch: cvt0f21
navigationbar: true
device-type: tablet
debug-tools: true
fota: true
default-drm: true
thermal: thermal-daemon
serialport: ttyS0
flashfiles: ini(fast_flashfiles=false, oemvars=false,installer=true,flash_dnx_os=false,blank_no_fw=true,version=3.0)
net: common
debug-crashlogd: true
debug-coredump: false
lights: true
power: true(power_throttle=true)
debug-usb-config: true(source_dev=dvcith-0-msc0)
intel_prop: true
trusty: false
memtrack: true
avb: true
health: true
slot-ab: true
abota-fw: true
firststage-mount: true
cpuset: autocores
usb-init: true
usb-audio-init: true
usb-otg-switch: true
vndk: true
public-libraries: true
device-specific: caas
hdcpd: true
treble: true
swap: zram_auto(size=1073741824,swappiness=true,hardware=gordon_peak)
art-config: true
psdapp: true
debugfs: true
disk-encryption: true
factory-scripts: true
filesystem_config: common
load_modules: true
gptbuild: true(size=12G,generate_craff=false,compress_gptimage=true)
dynamic-partitions: true(super_img_in_flashzip=true)
dbc: true
atrace: true
firmware: true(all_firmwares=true)
aaf: true
suspend: never
sensors: mediation
