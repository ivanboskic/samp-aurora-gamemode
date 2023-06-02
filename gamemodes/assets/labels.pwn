#include <ysilib\YSI_Coding\y_hooks>

forward Create3DandP(const text[], Float:vXU, Float:vYU, Float:vZU, vInt, vVW, pickupid, Float:radius);
public Create3DandP(const text[], Float:vXU, Float:vYU, Float:vZU, vInt, vVW, pickupid, Float:radius)
{

	CreateDynamic3DTextLabel(text, x_server, vXU, vYU, vZU, radius, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, vVW, vInt, -1, 20.0);
	CreateDynamicPickup(pickupid, 1, vXU, vYU, vZU, vVW, vInt);

}

CreatePickupsAnd3Ds()
{
    Create3DandP(""c_server"[ Opstina ]\n"c_white"'ENTER' za ulaz", 1483.2590, -1797.4061, 13.5684, -1, -1, 19133, 3.0); // Opstina ulaz
    Create3DandP(""c_server"[ Opstina ]\n"c_white"'ENTER' za izlaz", -2129.1213, -175.5832, -79.0954, -1, -1, 19133, 3.0); // Opstina izlaz

    return 1;
}

hook OnGameModeInit()
{

    print("assets/labels.pwn loading...");
    print("assets/labels.pwn loaded.");

    CreatePickupsAnd3Ds();

    return 1;

}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {

    if(newkeys & KEY_SECONDARY_ATTACK) {

        if(IsPlayerInRangeOfPoint(playerid, 3.0, 1483.2590, -1797.4061, 13.5684)) { // Opstina ulaz
            SetPlayerPos(playerid, -2129.1213, -175.5832, -79.0954);
            SetPlayerFacingAngle(playerid, 172.1563);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3.0, -2129.1213, -175.5832, -79.0954)) { // Opstina izlaz
            SetPlayerPos(playerid, 1483.2590, -1797.4061, 13.5684);
            SetPlayerFacingAngle(playerid, 357.7210);
        }

    }

    return 1;

}
