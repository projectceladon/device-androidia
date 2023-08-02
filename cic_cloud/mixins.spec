[main]
mixinsdir: ./mixins/groups
mixinsctl: true
mixinsrel: false

[mapping]
product.mk: device.mk

[groups]
audio: remote
bluetooth: dummy
camera: remote
device-specific: cic-cloud
codecs: configurable(hw_omx_video=true,sw_omx_video=true)
debug-crashlogd: true
debug-logs: true
gps: remote
graphics: true
health: true
houdini: true
input: remote
media: true(enable_msdk_omx=true,use_onevpl=true)
neuralnetworks: true
power: dummy
sensors: remote
wlan: dummy
