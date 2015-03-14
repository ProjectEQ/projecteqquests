#Zun Yhist event = custom b/c charm doesn't work
 
sub EVENT_SPAWN {
quest::settimer("Stoneshift", 1);
#quest::shout("$qglobals{NightmareSize} , $qglobals{NightmareGender}, $qglobals{NightmareRace}");
quest::settimer("Depop", 30);
}

sub EVENT_TIMER {


if ($timer eq "Stoneshift") {
quest::stoptimer("Stoneshift");
quest::npcrace($qglobals{NightmareRace}); 
quest::npcgender($qglobals{NightmareGender}) ;
quest::npcsize($qglobals{NightmareSize}); 
quest::npctexture($qglobals{NightmareTxt}); 
quest::delglobal("NightmareRace");
quest::delglobal("NightmareGender");
quest::delglobal("NightmareSize");
quest::delglobal("NightmareTxt");
}

if ($timer eq "Depop") {
quest::stoptimer("Depop");
quest::emote("returns to its owner");
quest::depop();
}

}

