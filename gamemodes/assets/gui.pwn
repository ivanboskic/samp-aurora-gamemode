#include <ysilib\YSI_Coding\y_hooks>

static Text:fortztde_TD[3];

hook OnGameModeInit() {

    fortztde_TD[0] = TextDrawCreate(246.860321, 427.349914, "www.aurora-ogc.com");
    TextDrawLetterSize(fortztde_TD[0], 0.378916, 1.862499);
    TextDrawAlignment(fortztde_TD[0], 1);
    TextDrawColor(fortztde_TD[0], -770501889);
    TextDrawSetShadow(fortztde_TD[0], 0);
    TextDrawSetOutline(fortztde_TD[0], 1);
    TextDrawBackgroundColor(fortztde_TD[0], 255);
    TextDrawFont(fortztde_TD[0], 3);
    TextDrawSetProportional(fortztde_TD[0], 1);

    fortztde_TD[1] = TextDrawCreate(248.334411, 420.416595, "21:00");
    TextDrawLetterSize(fortztde_TD[1], 0.153557, 0.876666);
    TextDrawAlignment(fortztde_TD[1], 1);
    TextDrawColor(fortztde_TD[1], -1);
    TextDrawSetShadow(fortztde_TD[1], 1);
    TextDrawSetOutline(fortztde_TD[1], 1);
    TextDrawBackgroundColor(fortztde_TD[1], 255);
    TextDrawFont(fortztde_TD[1], 2);
    TextDrawSetProportional(fortztde_TD[1], 1);

    fortztde_TD[2] = TextDrawCreate(359.731811, 419.833221, "12.2.2023");
    TextDrawLetterSize(fortztde_TD[2], 0.153557, 0.876666);
    TextDrawAlignment(fortztde_TD[2], 1);
    TextDrawColor(fortztde_TD[2], -1);
    TextDrawSetShadow(fortztde_TD[2], 1);
    TextDrawSetOutline(fortztde_TD[2], 1);
    TextDrawBackgroundColor(fortztde_TD[2], 255);
    TextDrawFont(fortztde_TD[2], 2);
    TextDrawSetProportional(fortztde_TD[2], 1);

    print("assets/gui.pwn loading...");
    print("assets/gui.pwn loaded.");

    return 1;

}

hook OnPlayerSpawn(playerid) {

    for(new i = 0; i < 3; i++) {
        TextDrawShowForPlayer(playerid, fortztde_TD[i]);
    }

    return 1;

}

task VremeDatum[1000]() {

    new string[128], year, mounth, day, hours, minutes, sec;
	getdate(year, mounth, day), gettime(hours, minutes, sec);
    format(string, sizeof(string), "%s%d:%s%d", ((hours < 10) ?("0") : ("")), hours, ((minutes < 10) ?("0") : ("")), minutes);
	TextDrawSetString(fortztde_TD[1], string);
	format(string, sizeof(string), "%s%d.%s%d.%s%d", ((day < 10) ?("0") : ("")), day, ((mounth < 10) ?("0") : ("")), mounth, ((year < 10) ?("0") : ("")), year);
	TextDrawSetString(fortztde_TD[2], string);

}