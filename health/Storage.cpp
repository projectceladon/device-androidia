/*
 * Copyright (C) 2018 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#define LOG_TAG "android.hardware.health@2.0-impl.celadon"
#define KLOG_LEVEL 6

#include <utils/String8.h>
#include <cutils/klog.h>
#include <android-base/file.h>
#include <android-base/strings.h>
#include <android-base/logging.h>
#include <health2/Health.h>

#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;
uint64_t sysfs_block_stat_val[13];
uint16_t ext_csd_stat_val[3];
const char mmc1_sysfs_eol[] = "/sys/bus/mmc/devices/mmc1:0001/pre_eol_info";
const char mmc1_sysfs_lifetime[] = "/sys/bus/mmc/devices/mmc1:0001/life_time";
const char mmc1_sysfs_diskstat[] = "/sys/block/mmcblk1/stat";
//const char mmc1_sysfs_version[] = "/sys/bus/mmc/devices/mmc1:0001/version"; //TO DO: in Storaged version 0.1

void get_diskstats_io(std::vector<struct DiskStats>& stats);


/*
 * It provides information on storage devices and other attributes...
 */
void get_storage_info(std::vector<struct StorageInfo>& info) {
        StorageInfo storageinfo;
        std::ifstream File;
        // std::string ext_csd_version_val;
        uint16_t ext_csd_lifetime_val;
        uint16_t ext_csd_lifetime_counter = 0;

        File.open(mmc1_sysfs_eol);	//parsing ext_csd end of life information
        File >> std::hex >> storageinfo.eol;
        File.close();

        File.open(mmc1_sysfs_lifetime);	//parsing ext_csd life time estimates
        while(File >> std::hex >> ext_csd_lifetime_val) {
                ext_csd_stat_val[ext_csd_lifetime_counter] = ext_csd_lifetime_val;
                ext_csd_lifetime_counter++;
        }
        storageinfo.lifetimeA = ext_csd_stat_val[0];
        storageinfo.lifetimeB = ext_csd_stat_val[1];
        File.close();

        /*
         * TO DO: ext_csd version parsing in Storaged version 0.1
	 * File.open(mmc1_sysfs_version);
         * File >> ext_csd_version_val;
         * storageinfo.version = ext_csd_version_val;
         * File.close();
         */
        storageinfo.version = "5.0";
        info.push_back(storageinfo);
}

void get_diskstats_io(std::vector<struct DiskStats>& stats) {
        // publishing diskstat metrics to storaged framework
        DiskStats diskstats;
        diskstats.reads = sysfs_block_stat_val[0];
        diskstats.readMerges = sysfs_block_stat_val[1];
        diskstats.readSectors = sysfs_block_stat_val[2];
        diskstats.readTicks = sysfs_block_stat_val[3];
        diskstats.writes = sysfs_block_stat_val[4];
        diskstats.writeMerges = sysfs_block_stat_val[5];
        diskstats.writeSectors = sysfs_block_stat_val[6];
        diskstats.writeTicks = sysfs_block_stat_val[7];
        diskstats.ioInFlight = sysfs_block_stat_val[8];
        diskstats.ioTicks = sysfs_block_stat_val[9];
        diskstats.ioInQueue = sysfs_block_stat_val[10];
        stats.push_back(diskstats);
}


/*
 * It provides disk statistics since boot
 */
void get_disk_stats(std::vector<struct DiskStats>& stats) {
	LOG(INFO) << LOG_TAG << "get_disk_stats:START\n";
        std::ifstream File;
        uint64_t sysfs_block_stat;
        uint64_t sysfs_block_read_counter = 0;

        File.open(mmc1_sysfs_diskstat);	//parsing MMC diskstat information
        while(File >> sysfs_block_stat) {
                sysfs_block_stat_val[sysfs_block_read_counter]= sysfs_block_stat;
                sysfs_block_read_counter++;
        }
        get_diskstats_io(stats);
}
