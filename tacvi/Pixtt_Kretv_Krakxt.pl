##Pixt2 Tacvi Boss#
##852 Soul Consumption#
##751 Ikkav Venom#

sub EVENT_SPAWN {
quest::settimer("Check", 25);
quest::delglobal("PKK_Door");
quest::setglobal("PKK_DoorExit", 1, 7, "F");
if ($qglobals{Pixtt_Kretv_Krakxt} == 1) {
$npc->SetHP($npc->GetMaxHP() * 0.9);
quest::setnexthpevent(71);
}
if ($qglobals{Pixtt_Kretv_Krakxt} == 2) {
$npc->SetHP($npc->GetMaxHP() * 0.7);
quest::setnexthpevent(51);
}
if ($qglobals{Pixtt_Kretv_Krakxt} == 3) {
$npc->SetHP($npc->GetMaxHP() * 0.5);
quest::setnexthpevent(31);
}
if ($qglobals{Pixtt_Kretv_Krakxt} == 4) {
$npc->SetHP($npc->GetMaxHP() * 0.3);
quest::setnexthpevent(11);
}
}

sub EVENT_COMBAT {
 
  if (($combat_state == 1) &&  (!defined($qglobals{Pixtt_Kretv_Krakxt})) ) {
quest::say("You shall regret trespassing into my chambers. The might of our kind shall smother the flames of life in this world, starting with you.!");
quest::say("Do you really think your paltry skills will be enough to best a being as powerful as I?");
quest::setnexthpevent(98);
quest::settimer("Soul", 3);
}

if ($combat_state == 0) {
quest::delglobal("PKK_Door");
quest::delglobal("Pixtt_Kretv_Krakxt");
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("Soul"); 
$npc->WipeHateList();
quest::depopall(298149);
quest::depopall(298146);
quest::depopall(298202);
quest::spawn2(298201,0,0, $x, $y, $z, $h);
quest::depop();
}
}

sub EVENT_HP  { 

if ($hpevent == 98) {
quest::setnexthpevent(91);
quest::setglobal("PKK_Door", 1, 7, "F");
}


if ($hpevent == 91) {
quest::say("Ha ha ha, you fools thought you could overpower me. You are nothing but food for my offspring. Come my children, strike them down and suck the marrow from their bones.");
quest::emote("body falls to the ground -- a lifeless husk freeing the hatchlings within.");
quest::setglobal("Pixtt_Kretv_Krakxt", 1, 7, "M30");
quest::spawn2(298146,93,0, 227, 284, -5.8, 189.1);
#
quest::spawn2(298149,0,0,$x+15, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y+15, $z, 189.1);
quest::spawn2(298202,0,0, $x, $y, $z, $h);
quest::depop();
}

if ($hpevent == 71) {
quest::say("Your efforts shall fail no matter how great. This is a reality you shall soon see as your vile existence ceases and my brood consumes your remains. ");
quest::emote("body falls to the ground -- a lifeless husk freeing the hatchlings within.");
quest::setglobal("Pixtt_Kretv_Krakxt", 2, 7, "M30");
quest::spawn2(298146,94,0, 111, 206, -6.7, 189.1);
quest::spawn2(298146,93,0, 227, 284, -5.8, 189.1);
#
quest::spawn2(298149,0,0,$x+15, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+7, $y+15, $z, 189.1);
quest::spawn2(298202,0,0, $x, $y, $z, $h);
quest::depop();
}
if ($hpevent == 51) {
quest::say("You show surprising strength and conviction, but you will not get any further. The time has come for you to be destroyed.");
quest::emote("body falls to the ground -- a lifeless husk freeing the hatchlings within.");
quest::setglobal("Pixtt_Kretv_Krakxt", 3, 7, "M30");
quest::spawn2(298146,95,0, 110.5, 209, -6.1, 189.1);
quest::spawn2(298146,94,0, 111, 206, -6.7, 189.1);
quest::spawn2(298146,93,0, 227, 284, -5.8, 189.1);
#
quest::spawn2(298149,0,0,$x+15, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+7, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+7, $y+7, $z, 189.1);
quest::spawn2(298202,0,0, $x, $y, $z, $h);
quest::depop();
}
if ($hpevent == 31) {
quest::say("My resolve is waning but I shall fight you to the very last breath. The commander looks down upon weaklings in his ranks and the ikaav are not ones to indulge in it.");
quest::emote("body falls to the ground -- a lifeless husk freeing the hatchlings within.");
quest::setglobal("Pixtt_Kretv_Krakxt", 4, 7, "M30");
quest::spawn2(298146,96,0, 231.5, 209, -6.7, 189.1);
quest::spawn2(298146,95,0, 110.5, 209, -6.1, 189.1);
quest::spawn2(298146,94,0, 111, 206, -6.7, 189.1);
quest::spawn2(298146,93,0, 227, 284, -5.8, 189.1);
#
quest::spawn2(298149,0,0,$x+15, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+7, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+7, $y+7, $z, 189.1);
quest::spawn2(298149,0,0,$x, $y, $z, 189.1);
quest::spawn2(298202,0,0, $x, $y, $z, $h);
quest::depop();
}
if ($hpevent == 11) {
quest::say("The end is inevitable, but if I must be defeated, some of you will join me in the afterlife.");
$Reset = 1;
quest::setnexthpevent(0);
quest::spawn2(298149,0,0,$x+15, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y-15, $z, 189.1);
quest::spawn2(298149,0,0,$x-15, $y+15, $z, 189.1);
quest::spawn2(298149,0,0,$x+7, $y+15, $z, 189.1);
}
}



sub EVENT_TIMER {

if ($timer eq "Check") {
quest::stoptimer("Check");
if ( (defined($qglobals{Pixtt_Kretv_Krakxt})) && ($combat_state == 0) ) {
quest::delglobal("Pixtt_Kretv_Krakxt");
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("Soul"); 
$npc->WipeHateList();
quest::depopall(298149);
quest::depopall(298146);
quest::depopall(88602);
quest::spawn2(298201,0,0, $x, $y, $z, $h);
quest::depop();
  }
}

	if ($timer eq "Soul") {
		my $TimeA = quest::ChooseRandom(25,26,27,28,29,30,31,32,33,34,35);
		quest::stoptimer("Soul");
		quest::settimer("Soul", $TimeA);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(852);
			#Soul Consump
		}
	}

}
  

sub EVENT_DEATH {
quest::emote ("body falls to the stone floor in a puddle of blackened blood. You step back as she slashes one last time, connecting with nothing but the stale air of the room");
quest::say ("This is not over. My commander will destroy you for this and when he does I hope it is my power he is wielding");
quest::delglobal("Pixtt_Kretv_Krakxt");
$timestamp = localtime(time);
quest::write("text_files/Tacvi.txt","[$timestamp]:$mname was killed by $name the $class.");
quest::signalwith(298141,1,0);
quest::signalwith(298142,1,0);
quest::signalwith(298143,1,0); 
quest::signalwith(298144,1,0);
quest::delglobal("PKK_Door");
quest::delglobal("PKK_DoorExit");
quest::signalwith(298220,1,0);;
}



