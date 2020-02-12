[include]
file: ../cic_dev/mixins.spec

[main]
mixinsctl: true

[groups]
device-specific: cic(file_encryption=true)
trusty: true(ref_target=celadon_64)
