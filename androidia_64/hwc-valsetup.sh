LOCAL_PATH="$(gettop)"
HWCOMPOSER_PATH="$(find vendor -name hwcomposer)"
export HWCVAL_ROOT=$LOCAL_PATH/$HWCOMPOSER_PATH/tests/hwc-val/tests/hwc
export VAL_HWC_TOP="`( cd "$HWCVAL_ROOT/../.." && pwd)`"
export PATH=$HWCVAL_ROOT/host_scripts:$HWCVAL_ROOT/tools:$PATH
export CLIENT_LOGS=$HOME/client_logs

# Target directories
export HWCVAL_TARGET_DIR=/data/validation/hwc
export HWCVAL_TARGET_SCRIPT_DIR=/data/validation/hwc
