#include <ysilib\YSI_Coding\y_hooks>

stock IsVehicleBicycle(m)
{
    if (m == 481 || m == 509 || m == 510) return true;
    
    return 0;
}

hook OnGameModeInit() {

    print("assets/stock.pwn loading...");
    print("assets/stock.pwn loaded.");

    return 1;

}