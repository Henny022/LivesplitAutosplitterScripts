state("NieRAutomata", "1.0")
{
	bool isWorldLoaded : 0x18F3978;
	byte playerNameSetStatus : 0x1461B38;
	string32 currentCutscene : 0x1978868, 0x1F4;
	bool isCutscenePlaying : 0x146A1AC;
	bool isLoading : 0x18DD444;
}

state("NieRAutomata", "1.01")
{
	bool isWorldLoaded : 0x110ADC0;
	byte playerNameSetStatus : 0x147B4BC;
	string32 currentCutscene : 0x19925E8, 0x1F4;
	bool isCutscenePlaying : 0x1483974;
	bool isLoading : 0x147BF50;
}

init
{
	int moduleSize = modules.First().ModuleMemorySize;
	switch (moduleSize) {
		case 113471488:
			version = "1.0";
			break;
		case 106266624:
			version = "1.01";
			break;
	}
	print("ModuleMemorySize: " + modules.First().ModuleMemorySize.ToString());
}

startup
{
	settings.Add("detectNewGame", true, "Detect New Game for auto-start");
	settings.SetToolTip("detectNewGame", "disabling this will make the auto-start work on chapterselect for NG+, but it will also make it work at a lot of other places");
	settings.Add("startAfterCutscene", false, "auto-start after cutscenes");
	settings.SetToolTip("startAfterCutscene", "usefull for testing");
	settings.Add("splitAnyCutscene", false, "split on any cutscenes");
	settings.SetToolTip("splitAnyCutscene", "usefull for testing");
	
	settings.Add("splits", true, "Splits");
	settings.Add("AB", true, "Ending [A/B]", "splits");
	settings.Add("prologue"        , true, "Prologue", "AB");
	settings.Add("movie/ev0010.usm", true, "[A] Crash", "prologue");
	settings.Add("movie/ev0030.usm", true, "[A] Marx 1 Start", "prologue");
	settings.Add("movie/ev0040.usm",false, "[B] TODO 9S stuff", "prologue");
	settings.Add("movie/ev0050.usm",false, "[B] TODO 9S stuff (Marx 1 end)", "prologue");
	settings.Add("movie/ev0060.usm", true, "[A] Marx 1 End", "prologue");
	settings.Add("movie/ev0070.usm", true, "[A] Marx 2 Start", "prologue");
	settings.Add("movie/ev0080.usm", true, "[A] Engels Start", "prologue");
	settings.Add("movie/ev0090.usm", true, "[A] Engels Intermission Start", "prologue");
	settings.Add("movie/ev0092.usm",false, "[B] Engels Intermission Start TODO ?", "prologue");
	settings.Add("movie/ev0120.usm", true, "[A] Engels Final phase Start", "prologue");
	settings.Add("movie/ev0140.usm", true, "[A/B] Prologue End", "prologue");
	settings.Add("desert"          , true, "Desert", "AB");
	settings.Add("movie/ev0190.usm",false, "[B] 9S Post Setup", "desert");
	settings.Add("movie/ev0200.usm", true, "[A] Reboot", "desert");
	settings.Add("movie/ev0210.usm", true, "[A] Landing", "desert");
	settings.Add("movie/ev0220.usm", true, "[A] Resistance Camp", "desert");
	settings.Add("movie/ev0225.usm",false, "[A] Desert Discovery", "desert");
	settings.Add("movie/ev0230.usm",false, "[B] Spirit of Fire", "desert");
	settings.Add("movie/ev0240.usm", true, "[A] Housing District", "desert");
	settings.Add("movie/ev0250.usm", true, "[A] Adam 1 Start", "desert");
	settings.Add("movie/ev0260.usm", true, "[A] Adam 1 End", "desert");
	settings.Add("movie/ev0262.usm", true, "[B] Adam Desert Fight Finish", "desert");
	settings.Add("park"            , true, "Amusement Park", "AB");
	settings.Add("movie/ev0290.usm",false, "[A] Amusement Park Discovery", "park");
	settings.Add("movie/ev0280.usm",false, "[B] Treasured Items", "park");
	settings.Add("movie/ev0300.usm", true, "[A] Beauvoir Start", "park");
	settings.Add("movie/ev0310.usm", true, "[A] Beauvoir Hacking", "park");
	settings.Add("movie/ev0320.usm", true, "[A] Beauvoir End", "park");
	settings.Add("movie/ev0322.usm", true, "[B] Beauvoir Fight Finish", "park");
	settings.Add("ruins"           , true, "Devastated Ruins", "AB");
	settings.Add("movie/ev0325.usm", true, "[A] Pascal's Village", "ruins");
	settings.Add("movie/ev0330.usm", true, "[A/B] City Engels", "ruins");
	settings.Add("movie/ev0340.usm",false, "[A] Negotiations Start", "ruins");
	settings.Add("movie/ev0350.usm", true, "[A] Negotiations Finish", "ruins");
	settings.Add("movie/ev0352.usm", true, "[B] Negotiations Finish", "ruins");
	settings.Add("movie/ev0360.usm",false, "[B] Parenticide", "ruins");
	settings.Add("forest"          , true, "Forest", "AB");
	settings.Add("movie/ev0370.usm", true, "[A] Commercial Facility (Emil)", "forest");
	settings.Add("movie/ev0380.usm", true, "[A] Forest Discovery", "forest");
	settings.Add("movie/ev0390.usm", true, "[A] A2 Start", "forest");
	settings.Add("movie/ev0400.usm", true, "[A/B] A2 End", "forest");
	settings.Add("movie/ev0410.usm",false, "[B] The Kind King", "forest");
	settings.Add("floodedCity"     , true, "Flooded City", "AB");
	settings.Add("movie/ev0430.usm", true, "[A] Flooded City Discovery", "floodedCity");
	settings.Add("movie/ev0440.usm", true, "[A] Grun Start", "floodedCity");
	settings.Add("movie/ev0450.usm", true, "[A] Grun Laser", "floodedCity");
	settings.Add("movie/ev0470.usm", true, "[A] Grun After Mortar (double split)", "floodedCity");
	settings.Add("movie/ev0475.usm",false, "[B] Grun Missile Launch", "floodedCity");
	settings.Add("movie/ev0482.usm", true, "[A] Grun Fight Finish ", "floodedCity");
	settings.Add("movie/ev0483.usm", true, "[B] Grun Fight Finish", "floodedCity");
	settings.Add("movie/ev0420.usm",false, "[B] In the Deep Sea", "floodedCity");
	settings.Add("copiedCity"      , true, "Copied City", "AB");
	settings.Add("movie/ev0510.usm", true, "[A] Copied City Discovery", "copiedCity");
	settings.Add("movie/ev0520.usm", true, "[A] Adam 2 Phase 1 Start", "copiedCity");
	settings.Add("movie/ev0525.usm", true, "[A] Adam 2 Phase 2 Start", "copiedCity");
	settings.Add("movie/ev0530.usm", true, "[A] Adam 2 Phase 3 Start", "copiedCity");
	settings.Add("movie/ev0500.usm",false, "[B] A Reason to Live", "copiedCity");
	settings.Add("movie/ev0550.usm", true, "[A] Copied City Finish", "copiedCity");
	settings.Add("movie/ev0552.usm", true, "[B] Copied City Finish", "copiedCity");
	settings.Add("factory"         , true, "Factory", "AB");
	settings.Add("movie/ev0570.usm", true, "[A] Mooks Start", "factory");
	settings.Add("movie/ev0580.usm", true, "[A/B] So-Shi End", "factory");
	settings.Add("movie/ev0610.usm", true, "[A] Factory End", "factory");
	settings.Add("movie/ev0612.usm",false, "[B] Factory End", "factory");
	settings.Add("movie/ev0590.usm",false, "[B] Together", "factory");
	settings.Add("endgame"         , true, "Endgame", "AB");
	settings.Add("movie/ev0630.usm", true, "[A] Burning Resistance Camp", "endgame");
	settings.Add("movie/ev0642.usm", true, "[A] Boku-Shi End", "endgame");
	settings.Add("movie/ev0650.usm", true, "[B] Boku-Shi Fight Finish", "endgame");
	settings.Add("movie/ev0655.usm", true, "[A] Core #1 End", "endgame");
	settings.Add("movie/ev0660.usm", true, "[A] Core #2 End", "endgame");
	settings.Add("movie/ev0670.usm", true, "[A] Eve Phase 3 Start", "endgame");
	settings.Add("movie/ev0693.usm", true, "[A] Ending [A]", "endgame");
	settings.Add("movie/ev0694.usm", true, "[B] Ending [B]", "AB");
	
	settings.Add("CD"              , true, "Ending [C/D]", "splits");
	settings.Add("attack"          , true, "All out Attack", "CD");
	settings.Add("movie/ev0760.usm",false, "[C/D] Saved all Squads", "attack");
	settings.Add("movie/ev0770.usm",false, "[C/D] Virus takes over", "attack");
	settings.Add("movie/ev0780.usm",false, "[C/D] Virus took over", "attack");
	settings.Add("movie/ev0790.usm",false, "[C/D] Deathwarp to bunker", "attack");
	settings.Add("movie/ev0810.usm",false, "[C/D] Bunker takeover", "attack");
	settings.Add("movie/ev0820.usm",false, "[C/D] Commander infected", "attack");
	settings.Add("movie/ev0830.usm", true, "[C/D] Bunker Finish", "attack");
	settings.Add("movie/ev0835.usm", true, "[C/D] 2B crashing", "attack");
	settings.Add("hegel"           , true, "Memories of Sand", "CD");
	settings.Add("movie/ev0875.usm", true, "[C/D] A2 Desert Fight Finish", "hegel");
	settings.Add("movie/ev0880.usm",false, "[C/D] A2 Memory Hacking Finish", "hegel");
	settings.Add("meatbox"         , true, "Meat Box", "CD");
	settings.Add("movie/ev0940.usm", true, "[C/D] Meat Box Finish", "meatbox");
	settings.Add("pascal"          , true, "Pascal's Despair", "CD");
	settings.Add("movie/ev0970.usm", true, "[C/D] Pascal Finish", "pascal");
	settings.Add("soulbox"         , true, "Soul Box", "CD");
	settings.Add("movie/ev1010.usm", true, "[C/D] Soul Box Finish", "soulbox");
	settings.Add("movie/ev1020.usm",false, "[C/D] post Soul Box Repairs", "soulbox");
	settings.Add("godbox"          , true, "God Box", "CD");
	settings.Add("movie/ev1030.usm",false, "[C/D] God Box Discovery", "godbox");
	settings.Add("movie/ev1040.usm",false, "[C/D] 21B", "godbox");
	settings.Add("movie/ev1050.usm",false, "[C/D] 21B dead", "godbox");
	settings.Add("movie/ev1060.usm", true, "[C/D] Auguste dead", "godbox");
	settings.Add("movie/ev1070.usm", true, "[C/D] God Box Finish", "godbox");
	settings.Add("tower"           , true, "Tower", "CD");
	settings.Add("movie/ev1120.usm",false, "[C/D] 2Bs", "tower");
	settings.Add("movie/ev1125.usm", true, "[C/D] 2B Clones Finish", "tower");
	settings.Add("movie/ev1180.usm",false, "[C/D] 9S red girls test", "tower");
	settings.Add("movie/ev1185.usm",false, "[C/D] 9S Tower Flightunit", "tower");
	settings.Add("movie/ev1190.usm", true, "[C/D] A2 Red Girls Finish", "tower");
	settings.Add("movie/ev1210.usm", true, "[C/D] Ko-Shi & Ro-Shi Finish", "tower");
	settings.Add("movie/ev1220.usm",false, "[C/D] pre 9S/A2 fight", "tower");
	settings.Add("movie/ev1230.usm",false, "[C/D] A2 dead", "tower");
	settings.Add("movie/ev1240.usm",false, "[C/D] 9S dead", "tower");
	settings.Add("movie/ev1250.usm", true, "[C] Ending C Finish", "tower");
	settings.Add("movie/ev1237.usm", true, "[C] Ending C post", "tower");
	settings.Add("movie/ev1232.usm", true, "[D] Ending D Finish Variation 1", "tower");
	settings.Add("movie/ev1233.usm", true, "[D] Ending D Finish Variation 2", "tower");
	settings.Add("movie/ev1234.usm", true, "[D] Ending D Finish Variation 3", "tower");
	settings.Add("movie/ev1235.usm", true, "[D] Ending D Finish Variation 4", "tower");
	settings.Add("E"               , true, "Ending [E]", "splits");
	settings.Add("movie/ev1270.usm", true, "[E] Ending E Finish", "E");
	settings.Add("others"          , true, "Others", "splits");
	settings.Add("movie/ev1280.usm",false, "Memories of War", "others");
	settings.Add("movie/ev1310.usm",false, "Restraints", "others");
	settings.Add("movie/ev1300.usm",false, "Revenge", "others");

	settings.SetToolTip("movie/ev0230.usm", "Picture Book");
	settings.SetToolTip("movie/ev0360.usm", "Picture Book");
	settings.SetToolTip("movie/ev0410.usm", "Picture Book");
	settings.SetToolTip("movie/ev0420.usm", "Picture Book");
	settings.SetToolTip("movie/ev0500.usm", "Picture Book");
	settings.SetToolTip("movie/ev0590.usm", "Picture Book");
	settings.SetToolTip("movie/ev1280.usm", "Picture Book");
	settings.SetToolTip("movie/ev1310.usm", "Picture Book, DLC");
	settings.SetToolTip("movie/ev1300.usm", "Picture Book, DLC");
}

start 
{
	// Thanks Kate for this auto-start logic
	if ((current.playerNameSetStatus == 1 || !settings["detectNewGame"]) && current.isWorldLoaded && !old.isWorldLoaded)
	{
		return true;
	}
	
	if(settings["startAfterCutscene"] && old.isCutscenePlaying && !current.isCutscenePlaying)
	{
		return true;
	}
}

split
{
	if(current.isCutscenePlaying && !old.isCutscenePlaying)
	{
		return (settings.ContainsKey(current.currentCutscene) && settings[current.currentCutscene]) || settings["splitAnyCutscene"];
	}
}

isLoading
{
	return current.isLoading;
}
