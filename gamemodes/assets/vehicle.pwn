#include <ysilib\YSI_Coding\y_hooks>

hook OnGameModeInit() {

    print("assets/vehicle.pwn loading...");
    print("assets/vehicle.pwn loaded.");

    return 1;

}

hook OnVehicleSpawn(vehicleid)
{

    static engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    if (IsVehicleBicycle(GetVehicleModel(vehicleid)))
    {
        SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_ON, 0, 0, doors, bonnet, boot, objective);
    }
    else 
    {
        SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, 0, 0, doors, bonnet, boot, objective);
    }

    return 1;

}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{

    new vehicle = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicle, engine, lights, alarm, doors, bonnet, boot, objective);
	if(newstate == PLAYER_STATE_DRIVER) 
    {
        if(engine == VEHICLE_PARAMS_OFF)
        {   
            SendClientMessage(playerid, -1, ""c_server"aurora // "c_white"Da upalite motor koristite tipku '2'");
        }
	}

	return 1;

}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{

	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        if(newkeys & KEY_LOOK_BEHIND)
        {
            new vehicle = GetPlayerVehicleID(playerid),engine, lights, alarm, doors, bonnet, boot, objective;

            if(IsVehicleBicycle(GetVehicleModel(vehicle)))
            {
                return 1;
            }

            GetVehicleParamsEx(vehicle, engine, lights, alarm, doors, bonnet, boot, objective);

            if(engine == VEHICLE_PARAMS_OFF)
            {
                SetVehicleParamsEx(vehicle, VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
            }

            else
            {
                SetVehicleParamsEx(vehicle, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
            }

            va_SendClientMessage(playerid, x_server, "aurora // "c_white"%s si motor.", (engine == VEHICLE_PARAMS_OFF) ? "Upalio" : "Ugasio");

            return 1;

        }

        if(newkeys & KEY_YES)
        {
            new vehicle = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
            
            if(IsVehicleBicycle(GetVehicleModel(vehicle)))
            {
                return 1;
            }
            
            GetVehicleParamsEx(vehicle, engine, lights, alarm, doors, bonnet, boot, objective);

            if(lights == VEHICLE_PARAMS_OFF)
            {
                SetVehicleParamsEx(vehicle, engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);
            }

            else
            {
                SetVehicleParamsEx(vehicle, engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
            }

            va_SendClientMessage(playerid, x_server, "aurora // "c_white"%s si svetla.", (lights == VEHICLE_PARAMS_OFF) ? "Upalio" : "Ugasio");

            return 1;

        }
    }

	return 1;

}