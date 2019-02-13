#ifndef _STORAGE_HAL_H_
#define _STORAGE_HAL_H_

#include <vector>
#include <android/hardware/health/1.0/types.h>
#include <android/hardware/health/2.0/IHealth.h>

using android::hardware::health::V2_0::StorageInfo;
using android::hardware::health::V2_0::DiskStats;
const char diskbus_build_property[] = "ro.boot.diskbus";

/*
 * Storaged ::Get disk statistics and get storage information utilities.
 */
class StorageInf {
public:
	virtual void get_diskstats(std::vector<struct DiskStats>& stats) = 0;
	virtual void get_storageinfo(std::vector<struct StorageInfo>& info) = 0;
	virtual ~StorageInf() {}
};

class SdaDev : public StorageInf {
public:
	void get_diskstats(std::vector<struct DiskStats>& stats);
	void get_storageinfo(std::vector<struct StorageInfo>& info);
};

class NvmeDev : public StorageInf {
public:
        void get_diskstats(std::vector<struct DiskStats>& stats);
        void get_storageinfo(std::vector<struct StorageInfo>& info);
};

class EmmcDev : public StorageInf {
public:
	void get_diskstats(std::vector<struct DiskStats>& stats);
        void get_storageinfo(std::vector<struct StorageInfo>& info);
};

class VdaDev : public StorageInf {
public:
        void get_diskstats(std::vector<struct DiskStats>& stats);
        void get_storageinfo(std::vector<struct StorageInfo>& info);
};

/*
 * publish diskstat metrics to storaged framework.
 */
void get_diskstats_io(std::vector<struct DiskStats>& stats);

/*
 * Read diskstat metrics from disk block path.
 */
void get_disk_blk(const char blkpath[], std::vector<struct DiskStats>& stats);
#endif  /* _STORAGE_HAL_H_ */
