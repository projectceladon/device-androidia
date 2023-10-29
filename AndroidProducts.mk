#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#Added test comment

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/celadon_ivi/celadon_ivi.mk \
    $(LOCAL_DIR)/apollo_ivi/apollo_ivi.mk \
    $(LOCAL_DIR)/blizzard_ivi/blizzard_ivi.mk

COMMON_LUNCH_CHOICES += \
    celadon_ivi-userdebug \
    apollo_ivi-userdebug \
    blizzard_ivi-userdebug
