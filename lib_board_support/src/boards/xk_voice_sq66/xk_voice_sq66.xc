// Copyright 2024 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

/* System headers */
#include <platform.h>

/* App headers */
extern "C" {
#include "dac3101.h"
#include "sw_pll.h"
}
#include "i2c.h"


i2c_regop_res_t i2c_reg_write(uint8_t device_addr, uint8_t reg, uint8_t data)
{
    uint8_t a_data[2] = {reg, data};
    size_t n;

    unsafe
    {
        i_i2c_client.write(device_addr, a_data, 2, n, 1);
    }

    if (n == 0)
    {
        return I2C_REGOP_DEVICE_NACK;
    }
    if (n < 2)
    {
        return I2C_REGOP_INCOMPLETE;
    }

    return I2C_REGOP_SUCCESS;
}

// Callbacks from dac3101
int dac3101_reg_write(uint8_t reg, uint8_t val){
    i2c_regop_res_t result = i2c_reg_write(DAC3101_I2C_DEVICE_ADDR, reg, val);
    return result;
}

/**
 * User defined function to perform the reset the device
 */
void dac3101_codec_reset(void* unsafe args){
    // Nothing
}

void dac3101_wait(uint32_t wait_ms){
    delay_milliseconds(wait_ms);
}


void xk_voice_sq66_AudioHwRemote(chanend c){

}

void xk_voice_sq66_AudioHwInit(const xk_voice_sq66_config_t& config){

}

void xk_voice_sq66_AudioHwConfig(unsigned samFreq, unsigned mClk, unsigned dsdMode,
    unsigned sampRes_DAC, unsigned sampRes_ADC){

}