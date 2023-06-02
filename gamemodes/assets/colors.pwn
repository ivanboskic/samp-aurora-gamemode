#include <ysilib\YSI_Coding\y_hooks>

#define     c_server        "{D21312}"
#define     c_red           "{ff1100}"
#define     c_blue          "{0099cc}"
#define     c_white         "{ffffff}"
#define     c_yellow        "{f2ff00}"
#define     c_green         "{009933}"
#define     c_pink          "{ff00bb}"
#define     c_ltblue        "{00f2ff}"
#define     c_orange        "{ffa200}"
#define     c_greey         "{787878}"

#define     x_server     0xD21312AA
#define     x_red        0xFF1100AA
#define     x_blue       0x0099CCAA
#define     x_white      0xffffffAA
#define     x_yellow     0xf2ff00AA
#define     x_green      0x009933AA
#define     x_pink       0xff00bbAA
#define     x_ltblue     0x00f2ffAA
#define     x_orange     0xffa200AA
#define     x_greey      0x787878AA
#define     x_purple     0xC2A2DAAA

hook OnGameModeInit() {

    print("assets/colors.pwn loading...");
    print("assets/colors.pwn loaded.");
    
    return 1;

}