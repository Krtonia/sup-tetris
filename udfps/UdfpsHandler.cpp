/*
 * Copyright (C) 2023 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "UdfpsHandler.nothing_tetris"

#include "UdfpsHandler.h"

#include <android-base/logging.h>
#include <fcntl.h>
#include <poll.h>
#include <thread>
#include <unistd.h>

#define HBM_PATH "/sys/devices/platform/soc/1401a000.dsi0/hbm"
#define FOD_STATUS_PATH "/sys/panel_feature/ui_status"

static bool readBool(int fd) {
    char c;
    int rc = lseek(fd, 0, SEEK_SET);
    if (rc) {
        LOG(ERROR) << "failed to seek fd, err: " << rc;
        return false;
    }

    rc = read(fd, &c, sizeof(char));
    if (rc != 1) {
        LOG(ERROR) << "failed to read fd, err: " << rc;
        return false;
    }

    return c != '0';
}

class NothingUdfpsHandler : public UdfpsHandler {
  public:
    void init(fingerprint_device_t* device) {
        mDevice = device;

        std::thread([this]() {
            int fd1 = open(HBM_PATH, O_RDONLY);
            int fd2 = open(FOD_STATUS_PATH, O_RDONLY);
            if (fd1 < 0 || fd2 < 0) {
                LOG(ERROR) << "failed to open fd1 or fd2: " << fd1 << ", " << fd2;
                return;
            }

            struct pollfd fds[2] = {
                {.fd = fd1, .events = POLLERR | POLLPRI, .revents = 0},
                {.fd = fd2, .events = POLLERR | POLLPRI, .revents = 0},
            };

            while (true) {
                int rc = poll(fds, 2, -1);
                if (rc < 0) {
                    LOG(ERROR) << "failed to poll fds, err: " << rc;
                    continue;
                }

                bool status1 = readBool(fd1);
                bool status2 = readBool(fd2);
                int combined = (status1 || status2) ? 1 : 0;

                mDevice->goodixExtCmd(mDevice, combined, 0);
            }
        }).detach();
    }

    void onFingerDown(uint32_t /*x*/, uint32_t /*y*/, float /*minor*/, float /*major*/) {
        // nothing
    }

    void onFingerUp() {
        // nothing
    }

    void onAcquired(int32_t /*result*/, int32_t /*vendorCode*/) {
        // nothing
    }

    void cancel() {
        // nothing
    }

  private:
    fingerprint_device_t* mDevice;
};

static UdfpsHandler* create() {
    return new NothingUdfpsHandler();
}

static void destroy(UdfpsHandler* handler) {
    delete handler;
}

extern "C" UdfpsHandlerFactory UDFPS_HANDLER_FACTORY = {
    .create = create,
    .destroy = destroy,
};
