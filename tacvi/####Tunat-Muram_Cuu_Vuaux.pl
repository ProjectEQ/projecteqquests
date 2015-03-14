#90%: Pixtt Xxeric Kex (flurries; spawns four ukun adds immediately) 
#80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns four ikaav hatchling adds if you take too long) 
#70%: Pixtt Riel Tavas (unstable construct adds if you take too long) CHECK
#60%: Zun`Muram Kvxe Pirik (single-target rampage; straight melee) 
#50%: Zun`Muram Yihst Vor (single-target rampage; straight melee) 
#40%: Zun`Muram Mordl Delt (single-target rampage; flurries; two "Zun`Muram Mordl Delt" adds) 
#30%: Zun`Muram Shaldn Boc (single-target rampage; straight melee - may AE rampage rarely..) 
#20%: Tunat`Muram Cuu Vauax (single-target rampage; AEs "Wave of Rage") 

sub EVENT_SPAWN {
$npc->SetHP($npc->GetMaxHP() * .2);
quest::setnexthpevent(21);
}

sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::say("I have played with you long enough. Now this all ends!");
quest::settimer("Wave", 5);
}

if (($combat_state == 0) &&  (!defined($qglobals{TunatOne_Dead})) ) {
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298112);
quest::spawn2(298114,0,0, 463.8, -170.8, 26.6, 54.9);
quest::depop();
}

if (($combat_state == 0) &&  (defined($qglobals{TunatOne_Dead})) ){
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298112);
quest::spawn2(298155,0,0, 309, -170.8, 21.3, 59.4);
quest::depop();
}

}


sub EVENT_TIMER {

	if ($timer eq "Wave") {
		my $TimeB = quest::ChooseRandom(40,45,50);
		quest::stoptimer("Wave");
		quest::settimer("Wave", $TimeB);
		plugin::CastOnTarget(4728);
	}

}

sub EVENT_DEATH {
quest::say ("You do not know what it is you have started here...");
quest::emote ("gasps one last time and collapses");
$timestamp = localtime(time);
quest::write("text_files/Tacvi.txt","[$timestamp]:$mname was killed by $name the $class.");
quest::signalwith(298219,1,0);
#quest::shout2("You may have defeated me and my commmanders, %name ... But you can not stop what is coming!");
}

