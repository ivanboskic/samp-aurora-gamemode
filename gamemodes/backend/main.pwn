#include <ysilib\YSI_Coding\y_hooks>

main()
{
    print("-                                     -");
	print(" Founder : whyllon                     ");
	print(" Version : v1.0 - BETA                 ");
	print(" Gamemode credits : realnaith          ");
	print(" Map credits: Muay,Smoke and others    ");
	print("-                                     -");
	print("> Gamemode Starting...                 ");
	print("> Aurora Gamemode Started             ");
    print("-                                     -");
}

hook OnGameModeInit() {

    print("backend/main.pwn loading...");
    print("backend/main.pwn loaded.");

    return 1;

}