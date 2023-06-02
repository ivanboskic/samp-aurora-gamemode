/*
Admin rankovi:
- Admin 1
- Admin 2
- Admin 3
- Head Admin
- Direktor
- Vlasnik

Helper rankovi:
- Helper

Promoter rankovi:
- Promoter
*/

#include <ysilib\YSI_Coding\y_hooks>

static stock const USER_PATH[64] = "/Users/%s.ini";

static 
    player_Admin[MAX_PLAYERS],
    player_AdminDutyTime[MAX_PLAYERS],
    player_Helper[MAX_PLAYERS],
    player_HelperDutyTime[MAX_PLAYERS],
    player_Promoter[MAX_PLAYERS],
    player_Skin[MAX_PLAYERS];

new bool:AdminDuty[MAX_PLAYERS];
new bool:HelperDuty[MAX_PLAYERS];

new aveh[MAX_PLAYERS] = { INVALID_VEHICLE_ID, ... }; 
new hveh[MAX_PLAYERS] = { INVALID_VEHICLE_ID, ... };
new promveh[MAX_PLAYERS] = { INVALID_VEHICLE_ID, ... };		

hook Account_Load(const playerid, const string: name[], const string: value[]);
hook Account_Load(const playerid, const string: name[], const string: value[])
{

	INI_Int("Admin", player_Admin[playerid]);
	INI_Int("AdminDuty", player_AdminDutyTime[playerid]);
    INI_Int("Helper", player_Helper[playerid]);
	INI_Int("HelperDuty", player_HelperDutyTime[playerid]);
    INI_Int("Promoter", player_Promoter[playerid]);

	return 1;
}

hook OnGameModeInit() {

    print("assets/staff.pwn loading...");
    print("assets/staff.pwn loaded.");
    
    return 1;

}

hook OnPlayerConnect(playerid) {

    aveh[playerid] = INVALID_VEHICLE_ID;
    hveh[playerid] = INVALID_VEHICLE_ID;
    promveh[playerid] = INVALID_VEHICLE_ID;

    return 1;

}

hook OnPlayerDisconnect(playerid, reason) {

    new INI:File = INI_Open(Account_Path(playerid));
    INI_SetTag(File,"data");
    INI_WriteInt(File, "Admin", player_Admin[playerid]);
	INI_WriteInt(File, "AdminDuty", player_AdminDutyTime[playerid]);
    INI_WriteInt(File, "Helper", player_Helper[playerid]);
	INI_WriteInt(File, "HelperDuty", player_HelperDutyTime[playerid]);
    INI_WriteInt(File, "Promoter", player_Promoter[playerid]);
    INI_Close(File);

    DestroyVehicle(aveh[playerid]);
    aveh[playerid] = INVALID_PLAYER_ID;

    DestroyVehicle(hveh[playerid]);
    hveh[playerid] = INVALID_PLAYER_ID;

    DestroyVehicle(promveh[playerid]);
    promveh[playerid] = INVALID_PLAYER_ID;

    return 1;

}

hook OnPlayerSpawn(playerid) {

    return 1;

}

hook OnVehicleDeath(vehicleid, killerid) {

    DestroyVehicle(aveh[vehicleid]);
    aveh[vehicleid] = INVALID_PLAYER_ID;

    DestroyVehicle(hveh[vehicleid]);
    hveh[vehicleid] = INVALID_PLAYER_ID;

    DestroyVehicle(promveh[vehicleid]);
    promveh[vehicleid] = INVALID_PLAYER_ID;

    return 1;

}

timer AdminDutyTimer[60000](playerid) {

    if(AdminDuty[playerid]) {

        player_AdminDutyTime[playerid]++;
        defer AdminDutyTimer(playerid);

    }

    return 1;

}

timer HelperDutyTimer[60000](playerid) {

    if(HelperDuty[playerid]) {

        player_HelperDutyTime[playerid]++;
        defer HelperDutyTimer(playerid);

    }

    return 1;

}

YCMD:aduty(playerid, params[], help) {

    if(!player_Admin[playerid]) return SendClientMessage(playerid, x_red, "error // "c_white"Niste ovlasceni!");
    if(AdminDuty[playerid] == false) {
        SetPlayerHealth(playerid, 100);
        SetPlayerArmour(playerid, 100);
        SetPlayerSkin(playerid, 294);
        SetPlayerColor(playerid, x_red);

        AdminDuty[playerid] = true;
        defer AdminDutyTimer(playerid);

        if(player_Admin[playerid] == 1) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Admin "c_red"%s "c_white"("c_red"Duty:%d min"c_white") je sada na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 2) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Admin "c_red"%s "c_white"("c_red"Duty:%d min"c_white") je sada na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 3) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Admin "c_red"%s "c_white"("c_red"Duty:%d min"c_white") je sada na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 4) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Head Admin "c_red"%s "c_white"("c_red"Duty:%d min"c_white") je sada na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 5) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Direktor "c_red"%s "c_white"("c_red"Duty:%d min"c_white") je sada na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 6) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Vlasnik "c_red"%s "c_white"("c_red"Duty:%d min"c_white") je sada na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
    }
    else if(AdminDuty[playerid] == true) {
        SetPlayerHealth(playerid, 100);
        SetPlayerArmour(playerid, 0);
        SetPlayerSkin(playerid, player_Skin[playerid] = 240);
        SetPlayerColor(playerid, x_white);

        AdminDuty[playerid] = false;

        if(player_Admin[playerid] == 1) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Admin "c_red"%s "c_white"("c_red"Duty:%d min"c_white") vise nije na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 2) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Admin "c_red"%s "c_white"("c_red"Duty:%d min"c_white") vise nije na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 3) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Admin "c_red"%s "c_white"("c_red"Duty:%d min"c_white") vise nije na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 4) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Head Admin "c_red"%s "c_white"("c_red"Duty:%d min"c_white") vise nije na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 5) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Direktor "c_red"%s "c_white"("c_red"Duty:%d min"c_white") vise nije na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        if(player_Admin[playerid] == 6) {
            va_SendClientMessageToAll(x_red, "aduty // "c_white"Vlasnik "c_red"%s "c_white"("c_red"Duty:%d min"c_white") vise nije na duznosti.", ReturnPlayerName(playerid), player_AdminDutyTime[playerid]);
        }
        new INI:File = INI_Open(Account_Path(playerid));
        INI_SetTag(File,"data");
        INI_WriteInt(File, "AdminDuty", player_AdminDutyTime[playerid]);
        INI_Close(File);
    }

    return 1;

}

YCMD:hduty(playerid, params[], help) {

    if(!player_Helper[playerid]) return SendClientMessage(playerid, x_red, "error // "c_white"Niste ovlasceni!");
    if(HelperDuty[playerid] == false) {
        SetPlayerHealth(playerid, 100);
        SetPlayerArmour(playerid, 100);
        SetPlayerSkin(playerid, 188);
        SetPlayerColor(playerid, x_green);

        HelperDuty[playerid] = true;
        defer HelperDutyTimer(playerid);

        if(player_Helper[playerid] == 1) {
            va_SendClientMessageToAll(x_green, "hduty // "c_white"Helper "c_green"%s "c_white"("c_green"Duty:%d min"c_white") je sada na duznosti.", ReturnPlayerName(playerid), player_HelperDutyTime[playerid]);
        }
    }
    else if(HelperDuty[playerid] == true) {
        SetPlayerHealth(playerid, 100);
        SetPlayerArmour(playerid, 0);
        SetPlayerSkin(playerid, player_Skin[playerid] = 240);
        SetPlayerColor(playerid, x_white);

        HelperDuty[playerid] = false;

        if(player_Admin[playerid] == 1) {
            va_SendClientMessageToAll(x_green, "hduty // "c_white"Helper "c_green"%s "c_white"("c_green"Duty:%d min"c_white") vise nije na duznosti.", ReturnPlayerName(playerid), player_HelperDutyTime[playerid]);
        }
        new INI:File = INI_Open(Account_Path(playerid));
        INI_SetTag(File,"data");
        INI_WriteInt(File, "HelperDuty", player_HelperDutyTime[playerid]);
        INI_Close(File);
    }

    return 1;

}

YCMD:makeadmin(playerid, params[], help) {

    static targetid, level;
    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, x_red, "rcon // "c_white"Nisi ulogovan na rcon!");
    if(sscanf(params, "ri", targetid, level)) return SendClientMessage(playerid, x_yellow, "usage // "c_white"/makeadmin [id] [level]");
    if(level < 1 || level > 6) return SendClientMessage(playerid, x_red, "error // "c_white"Ne moze manje od 1 i vise od 6.");
    if(!level && !player_Admin[targetid]) return SendClientMessage(playerid, x_red, "error // "c_white"Taj igrac nije u admin timu.");
    if(level == player_Admin[targetid]) return SendClientMessage(playerid, x_red, "error // "c_white"Taj igrac je vec u admin timu.");
    player_Admin[targetid] = level;
    if(!level) {
        va_SendClientMessage(targetid, x_yellow, "info // "c_white"%s vas je izbacio iz admin tima.", ReturnPlayerName(playerid));
        va_SendClientMessage(playerid, x_yellow, "info // "c_white"Izbacili ste %s iz admin tima.", ReturnPlayerName(targetid));
    }
    else {
        va_SendClientMessage(targetid, x_yellow, "info // "c_white"%s vas je ubacio u admin tim.", ReturnPlayerName(playerid));
        va_SendClientMessage(playerid, x_yellow, "info // "c_white"Ubacili ste %s u admin tim.", ReturnPlayerName(targetid));
    }

    new INI:File = INI_Open(Account_Path(playerid));
    INI_SetTag(File,"data");
    INI_WriteInt(File, "Admin", player_Admin[playerid]);
    INI_Close(File);

    return 1;

}

YCMD:makehelper(playerid, params[], help) {

    static targetid, level;
    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, x_red, "rcon // "c_white"Nisi ulogovan na rcon!");
    if(sscanf(params, "ri", targetid, level)) return SendClientMessage(playerid, x_yellow, "usage // "c_white"/makehelper [id] [level]");
    if(level < 1 || level > 1) return SendClientMessage(playerid, x_red, "error // "c_white"Ne moze manje od 1.");
    if(!level && !player_Helper[targetid]) return SendClientMessage(playerid, x_red, "error // "c_white"Taj igrac nije u helper timu.");
    if(level == player_Helper[targetid]) return SendClientMessage(playerid, x_red, "error // "c_white"Taj igrac je vec u helper timu.");
    player_Helper[targetid] = level;
    if(!level) {
        va_SendClientMessage(targetid, x_yellow, "info // "c_white"%s vas je izbacio iz helper tima.", ReturnPlayerName(playerid));
        va_SendClientMessage(playerid, x_yellow, "info // "c_white"Izbacili ste %s iz helper tima.", ReturnPlayerName(targetid));
    }
    else {
        va_SendClientMessage(targetid, x_yellow, "info // "c_white"%s vas je ubacio u helper tim.", ReturnPlayerName(playerid));
        va_SendClientMessage(playerid, x_yellow, "info // "c_white"Ubacili ste %s u helper tim.", ReturnPlayerName(targetid));
    }

    new INI:File = INI_Open(Account_Path(playerid));
    INI_SetTag(File,"data");
    INI_WriteInt(File, "Helper", player_Helper[playerid]);
    INI_Close(File);

    return 1;

}

YCMD:makepromoter(playerid, params[], help) {

    static targetid, level;
    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, x_red, "rcon // "c_white"Nisi ulogovan na rcon!");
    if(sscanf(params, "ri", targetid, level)) return SendClientMessage(playerid, x_yellow, "usage // "c_white"/makepromoter [id] [level]");
    if(level < 1 || level > 1) return SendClientMessage(playerid, x_red, "error // "c_white"Ne moze manje od 1.");
    if(!level && !player_Promoter[targetid]) return SendClientMessage(playerid, x_red, "error // "c_white"Taj igrac nije u promoter timu.");
    if(level == player_Promoter[targetid]) return SendClientMessage(playerid, x_red, "error // "c_white"Taj igrac je vec u promoter timu.");
    player_Promoter[targetid] = level;
    if(!level) {
        va_SendClientMessage(targetid, x_yellow, "info // "c_white"%s vas je izbacio iz promoter tima.", ReturnPlayerName(playerid));
        va_SendClientMessage(playerid, x_yellow, "info // "c_white"Izbacili ste %s iz promoter tima.", ReturnPlayerName(targetid));
    }
    else {
        va_SendClientMessage(targetid, x_yellow, "info // "c_white"%s vas je ubacio u promoter tim.", ReturnPlayerName(playerid));
        va_SendClientMessage(playerid, x_yellow, "info // "c_white"Ubacili ste %s u promoter tim.", ReturnPlayerName(targetid));
    }

    new INI:File = INI_Open(Account_Path(playerid));
    INI_SetTag(File,"data");
    INI_WriteInt(File, "Promoter", player_Promoter[playerid]);
    INI_Close(File);

    return 1;

}

YCMD:aveh(playerid, params[], help) {

    static Float:x, Float:y, Float:z;
    if(!player_Admin[playerid]) return SendClientMessage(playerid, x_red, "error // "c_white"Niste ovlasceni!");
    if(AdminDuty[playerid] == false) return SendClientMessage(playerid, x_red, "error // "c_white"Nisi na admin duznosti.");
    GetPlayerPos(playerid, x, y, z);
    if(aveh[playerid] == INVALID_VEHICLE_ID) {
        new modelid = strval(params), color1, color2;
        if(sscanf(params, "ddd", modelid, color1, color2)) return SendClientMessage(playerid, x_yellow, "usage // "c_white"/aveh [modelid] [boja 1] [boja 2]");
        if(400 > modelid > 611) return SendClientMessage(playerid, x_yellow, "usage // "c_white"Validni modeli su od 400 do 611.");
        new vehicleid = aveh[playerid] = CreateVehicle(modelid, x, y, z, 0.0, color1, color2, -1);
        SetVehicleNumberPlate(vehicleid, "ADMIN");
        PutPlayerInVehicle(playerid, vehicleid, 0);
        SendClientMessage(playerid, x_red, "admin // "c_white"Stvorili ste admin vozilo.");
        static engine, lights, alarm, doors, bonnet, boot, objective;
        if(engine == VEHICLE_PARAMS_OFF)
        {
            SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
        }
    }
    else {
        DestroyVehicle(aveh[playerid]);
        aveh[playerid] = INVALID_PLAYER_ID;
        SendClientMessage(playerid, x_red, "admin // "c_white"Unistili ste admin vozilo.");
    }

    return 1;

}

YCMD:hveh(playerid, params[], help) {

    static Float:x, Float:y, Float:z;
    if(!player_Helper[playerid]) return SendClientMessage(playerid, x_red, "error // "c_white"Niste ovlasceni!");
    if(HelperDuty[playerid] == false) return SendClientMessage(playerid, x_red, "error // "c_white"Nisi na helper duznosti.");
    GetPlayerPos(playerid, x, y, z);
    if(hveh[playerid] == INVALID_VEHICLE_ID) {
        new modelid = strval(params), color1, color2;
        if(sscanf(params, "ddd", modelid, color1, color2)) return SendClientMessage(playerid, x_yellow, "usage // "c_white"/hveh [modelid] [boja 1] [boja 2]");
        if(400 > modelid > 611) return SendClientMessage(playerid, x_yellow, "usage // "c_white"Validni modeli su od 400 do 611.");
        new vehicleid = hveh[playerid] = CreateVehicle(modelid, x, y, z, 0.0, color1, color2, -1);
        SetVehicleNumberPlate(vehicleid, "HELPER");
        PutPlayerInVehicle(playerid, vehicleid, 0);
        SendClientMessage(playerid, x_green, "helper // "c_white"Stvorili ste helper vozilo.");
        static engine, lights, alarm, doors, bonnet, boot, objective;
        if(engine == VEHICLE_PARAMS_OFF)
        {
            SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
        }
    }
    else {
        DestroyVehicle(hveh[playerid]);
        hveh[playerid] = INVALID_PLAYER_ID;
        SendClientMessage(playerid, x_green, "helper // "c_white"Unistili ste helper vozilo.");
    }

    return 1;

}

YCMD:pveh(playerid, params[], help) {

    static Float:x, Float:y, Float:z;
    if(!player_Promoter[playerid]) return SendClientMessage(playerid, x_red, "error // "c_white"Niste ovlasceni!");
    GetPlayerPos(playerid, x, y, z);
    if(promveh[playerid] == INVALID_VEHICLE_ID) {
        new modelid = strval(params), color1, color2;
        if(sscanf(params, "ddd", modelid, color1, color2)) return SendClientMessage(playerid, x_yellow, "usage // "c_white"/pveh [modelid] [boja 1] [boja 2]");
        if(400 > modelid > 611) return SendClientMessage(playerid, x_yellow, "usage // "c_white"Validni modeli su od 400 do 611.");
        new vehicleid = hveh[playerid] = CreateVehicle(modelid, x, y, z, 0.0, color1, color2, -1);
        SetVehicleNumberPlate(vehicleid, "PROMOTER");
        PutPlayerInVehicle(playerid, vehicleid, 0);
        SendClientMessage(playerid, x_yellow, "promoter // "c_white"Stvorili ste promoter vozilo.");
        static engine, lights, alarm, doors, bonnet, boot, objective;
        if(engine == VEHICLE_PARAMS_OFF)
        {
            SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
        }
    }
    else {
        DestroyVehicle(promveh[playerid]);
        promveh[playerid] = INVALID_PLAYER_ID;
        SendClientMessage(playerid, x_yellow, "promoter // "c_white"Unistili ste promoter vozilo.");
    }

    return 1;

}

YCMD:fv(playerid, params[], help) {

    if(!player_Admin[playerid] && !player_Helper[playerid]) return SendClientMessage(playerid, x_red, "error // "c_white"Niste ovlasceni!");
    if(AdminDuty[playerid] == false && HelperDuty[playerid] == false) return SendClientMessage(playerid, x_red, "error // "c_white"Morate biti na admin/helper duznosti.");
    new vehicleid = GetPlayerVehicleID(playerid);
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, x_red, "error // "c_white"Niste u vozilu!");
    RepairVehicle(vehicleid);
    SetVehicleHealth(vehicleid, 1000);

    return 1;

}

YCMD:cc(playerid, params[], help) {

    if(!player_Admin[playerid]) return SendClientMessage(playerid, x_red, "error // "c_white"Niste ovlasceni!");
    if(AdminDuty[playerid] == false) return SendClientMessage(playerid, x_red, "error // "c_white"Nisi na admin duznosti.");
    for(new cc; cc < 110; cc++)
	{
		SendClientMessageToAll(-1, "");
	}
    if(player_Admin[playerid] == 1) {
        va_SendClientMessageToAll(x_red, "clearchat // "c_white"Admin "c_red"%s "c_white"je ocistio chat (www.aurora-rp.com).", ReturnPlayerName(playerid));
    }
    if(player_Admin[playerid] == 2) {
        va_SendClientMessageToAll(x_red, "clearchat // "c_white"Admin "c_red"%s "c_white"je ocistio chat (www.aurora-rp.com).", ReturnPlayerName(playerid));
    }
    if(player_Admin[playerid] == 3) {
        va_SendClientMessageToAll(x_red, "clearchat // "c_white"Admin "c_red"%s "c_white"je ocistio chat (www.aurora-rp.com).", ReturnPlayerName(playerid));
    }
    if(player_Admin[playerid] == 4) {
        va_SendClientMessageToAll(x_red, "clearchat // "c_white"Head Admin "c_red"%s "c_white"je ocistio chat (www.aurora-rp.com).", ReturnPlayerName(playerid));
    }
    if(player_Admin[playerid] == 5) {
        va_SendClientMessageToAll(x_red, "clearchat // "c_white"Direktor "c_red"%s "c_white"je ocistio chat (www.aurora-rp.com).", ReturnPlayerName(playerid));
    }
    if(player_Admin[playerid] == 6) {
        va_SendClientMessageToAll(x_red, "clearchat // "c_white"Vlasnik "c_red"%s "c_white"je ocistio chat (www.aurora-rp.com).", ReturnPlayerName(playerid));
    }

    return 1;

}

YCMD:jetpack(playerid, params[], help) {
	new Float:Pos[ 3 ];
    if(!player_Admin[playerid]) return SendClientMessage(playerid, x_red, "error // "c_white"Niste ovlasceni!");
    if(AdminDuty[playerid] == false) return SendClientMessage(playerid, x_red, "error // "c_white"Nisi na admin duznosti.");
	if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK) {
		GetPlayerPos(playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ]);
		SetPlayerPos(playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ]+2);
		SendClientMessage(playerid, x_red, "aurora // "c_white"Skinuo si jetpack te je unisten.");
	}
	else {
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
		SendClientMessage(playerid, x_red, "aurora // "c_white"Uzeo si jetpack.");
	}
	return 1;
}

YCMD:gethere(playerid, params[], help) {

    new targetid = INVALID_PLAYER_ID, Float:x, Float:y, Float:z;
    if(!player_Admin[playerid]) return SendClientMessage(playerid, x_red, "error // "c_white"Niste ovlasceni!");
    if(AdminDuty[playerid] == false) return SendClientMessage(playerid, x_red, "error // "c_white"Nisi na admin duznosti.");
    if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, x_yellow, "usage // "c_white"/gethere [id]");
    if(targetid == INVALID_PLAYER_ID) return SendClientMessage(playerid, x_red, "error // "c_white"Taj igrac nije na serveru!");
    GetPlayerPos(playerid, x, y, z);
	SetPlayerPos(targetid, x+1, y, z+1);
	SetPlayerInterior(targetid, GetPlayerInterior(playerid));
	SetPlayerVirtualWorld(targetid, GetPlayerVirtualWorld(playerid));
    va_SendClientMessage(playerid, x_server, "aurora // "c_white"Portali ste igraca %s do sebe.", ReturnPlayerName(targetid));
    va_SendClientMessage(targetid, x_server, "aurora // "c_white"Admin %s vas je portao do sebe.", ReturnPlayerName(playerid));

    return 1;

}