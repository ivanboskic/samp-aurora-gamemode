/**
TODO:
 */

#define YSI_NO_HEAP_MALLOC
#define YSI_NO_VERSION_CHECK

#include <a_samp>
#include <a_actor>
#include <a_objects>
#include <a_players>
#include <a_vehicles>
#include <actor_plus>
#include <ysilib\YSI_Coding\y_hooks>
#include <ysilib\YSI_Core\y_utils.inc>
#include <ysilib\YSI_Storage\y_ini>
#include <ysilib\YSI_Coding\y_timers>
#include <ysilib\YSI_Visual\y_commands>
#include <ysilib\YSI_Data\y_foreach>
#include <ysilib\YSI_Data\y_iterate>
#include <ysilib\YSI_Coding\y_va>
#include <crashdetect>
#include <sscanf2>
#include <streamer>
#include <mapfix>
#define OD_METHOD METHOD_BOX
#include <optidraw>
#include <modelsizes>
#include <easyDialog>
#include <weapon-config>
#include <SKY>
#include <Pawn.RakNet>
#include <formatex>
#include <distance>

//- assets
#include "assets/colors.pwn"
#include "assets/gui.pwn"
#include "assets/labels.pwn"
#include "assets/reglog.pwn"
#include "assets/staff.pwn"
#include "assets/stock.pwn"
#include "assets/vehicle.pwn"
//-
#include "assets/end/do-not-look"

public OnGameModeInit()
{
	DisableInteriorEnterExits();
	ManualVehicleEngineAndLights();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetNameTagDrawDistance(20.0);
	LimitGlobalChatRadius(20.0);
	AllowInteriorWeapons(1);
	EnableVehicleFriendlyFire();
	EnableStuntBonusForAll(0);

	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerTeam(playerid, NO_TEAM);

	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

//- backend
#include "backend/main.pwn"
//-
#include "backend/end/do-not-look"

//- frontend
#include "frontend/ch_ext.pwn"
#include "frontend/ch_int.pwn"
#include "frontend/market_ext.pwn"
#include "frontend/pd_ext.pwn"
//-
#include "frontend/end/do-not-look"

//- jobs
#include "jobs/job_main.pwn"
//-