[main]
mixinsdir: ./mixins/groups
mixinsctl: true
mixinsrel: false

[mapping]
product.mk: device.mk

[groups]
kernel: gmin64(useprebuilt=false,src_path=kernel/lts2021-chromium, loglevel=7, interactive_governor=false, relative_sleepstates=false, modules_in_bootimg=false, external_modules=,debug_modules=, use_bcmdhd=false, use_iwlwifi=false, extmod_platform=bxt, iwl_defconfig=, cfg_path=config-lts/lts2021-chromium, more_modules=true, lts2021_chromium_src_path=kernel/lts2021-chromium, lts2021_chromium_cfg_path=config-lts/lts2021-chromium, linux_intel_lts2021_src_path=kernel/linux-intel-lts2021, linux_intel_lts2021_cfg_path=config-lts/linux-intel-lts2021)
disk-bus: auto
boot-arch: project-celadon(uefi_arch=x86_64,fastboot=efi,ignore_rsci=true,disable_watchdog=true,watchdog_parameters=10 30,verity_warning=false,txe_bind_root_of_trust=false,bootloader_block_size=4096,verity_mode=false,disk_encryption=false,file_encryption=true,metadata_encryption=true,fsverity=true,target=caas_cvmb,ignore_not_applicable_reset=true,self_usb_device_mode_protocol=true,usb_storage=true,live_boot=true,userdata_checkpoint=true,data_use_f2fs=true)
sepolicy: permissive
bluetooth: btusb(ivi=false)
audio: ranchu
vendor-partition: true(partition_size=600,partition_name=vendor)
vendor-boot: true(partition_size=16,bootconfig_enable=true)
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
media: auto(enable_msdk_omx=false, add_sw_msdk=false, opensource_msdk=true, opensource_msdk_omx_il=false)
graphics: auto(gen9+=true,vulkan=true,minigbm=true,gralloc1=true,enable_guc=false)
storage: sdcard-v-usb-only(adoptablesd=false,adoptableusb=false)
ethernet: dhcp
camera-ext: ext-camera-only
rfkill: true(force_disable=)
wlan: iwlwifi(libwifi-hal=true)
codecs: configurable(sw_omx_video=false, hw_omx_video=false, platform=tgl, profile_file=media_profiles_1080p.xml, gpu=gen12)
codec2: true(enable_msdk_c2=true, use_onevpl=true, platform=adl, hw_ve_vp9=true, hw_vd_vp8=false)
usb: host
usb-gadget: auto(usb_config=adb,mtp_adb_pid=0x0a5f,ptp_adb_pid=0x0a61,rndis_pid=0x0a62,rndis_adb_pid=0x0a63,bcdDevice=0x0,bcdUSB=0x200,controller=dwc3.2.auto,f_acm=false,f_dvc_trace=true,dvctrace_source_dev=dvcith-0-msc0)
midi: true
touch: cvt0f21
navigationbar: true
device-type: tablet
debug-tools: true(logcat2hvc=true)
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
tpm: false
avx: auto
health: hal
slot-ab: true
abota-fw: true
firststage-mount: true
cpuset: autocores
usb-init: true
usb-audio-init: false
usb-otg-switch: true
vndk: true
public-libraries: true
device-specific: caas_cvmb
hdcpd: true
treble: true
swap: zram_auto(size=1073741824,swappiness=true,hardware=gordon_peak,disk_based_swap=true)
art-config: true
debugfs: true
disk-encryption: true
factory-scripts: true
filesystem_config: common
telephony: false
load_modules: true
gptbuild: true(size=32G,generate_craff=false,compress_gptimage=true)
dynamic-partitions: true(super_img_in_flashzip=true,super_partition_size=5000,virtual_ab=true,virtual_ab_compression=true)
dbc: true
atrace: true
firmware: true(all_firmwares=false)
aaf: true
suspend: auto
sensors: mediation(enable_sensor_list=true)
bugreport: true
mainline-mod: true
houdini: true
neuralnetworks: true(vsock-remote-infer=true)
