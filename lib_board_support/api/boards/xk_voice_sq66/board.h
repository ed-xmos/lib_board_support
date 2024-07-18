// Copyright 2024 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.
/// Hardware setup APIs for the XK_VOICE_SQ66

#ifndef __XK_VOICE_SQ66_BOARD_H__
#define __XK_VOICE_SQ66_BOARD_H__

#include <xccompat.h>

typedef struct {

    /// initial mclk config used in AudioHwInit.
    unsigned default_mclk;
} xk_voice_sq66_config_t;


//// XUA hw setup convenience APIs

void xk_voice_sq66_AudioHwRemote(chanend c);
void xk_voice_sq66_AudioHwInit(const xk_voice_sq66_config_t& config);
void xk_voice_sq66_AudioHwConfig(unsigned samFreq, unsigned mClk, unsigned dsdMode,
    unsigned sampRes_DAC, unsigned sampRes_ADC);

#endif // __XK_VOICE_SQ66_BOARD_H__
