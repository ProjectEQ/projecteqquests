#First Tacvi Boss
#4577 hoof tample
#4728 Wave of rage
#4729 Spirit Cleaver


sub EVENT_WAYPOINT_DEPART {
$npc->SaveGuardSpot(0);
}

sub EVENT_SPAWN {
quest::delglobal("PXX_Door");
quest::setglobal("PXX_DoorExit", 1, 7, "F");
}


sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::say("You were not invited to see our commander!");
quest::emote("stomps her hoofs with rage");
quest::setnexthpevent(98);
quest::settimer("Hoof", 15);
quest::settimer("Cleave", 40);
#Snare#$npc->CastSpell(512, $mobid, -1);
}

if ($combat_state == 0) {
quest::delglobal("PXX_Door");

quest::settimer("Speedreset", 45);
quest::modifynpcstat("atk", 2000);	#was 3500
quest::modifynpcstat("accuracy", 150);	#was 350
quest::modifynpcstat("max_hit", 8800);
$npc->SetHP($npc->GetMaxHP() * 1);
#quest::settimer("Root", 30); 
quest::emote("calms down");
quest::stoptimer("Hoof"); 
quest::stoptimer("Wave");
quest::stoptimer("Cleave");
$npc->WipeHateList();
quest::depopall(297041);
quest::depopall(297042); 
quest::depopall(297043);
quest::depopall(297044); 
$npc->GMMove(125.2, -165.3, -6.5);
#quest::spawn2(297039,0,0, 125.2, -165.3, -6.5, 189.1);
#quest::depop();
}
}

sub EVENT_HP  { 

if ($hpevent == 98) {
quest::setnexthpevent(91);
quest::setglobal("PXX_Door", 1, 7, "F");
}


if ($hpevent == 91) {
quest::setnexthpevent(51);
$npc->BuffFadeBySpellID(512);
quest::modifynpcstat("runspeed", 1);
quest::emote("stomps her hoofs wildly");
}

if ($hpevent == 51) {
quest::setnexthpevent(31);
quest::spawn2(297041,0,0, 125.2+15, -165.3+15, $z, $h);
quest::spawn2(297042,0,0, 125.2-15, -165.3+15, $z, $h);
quest::spawn2(297043,0,0, 125.2+15, -165.3-15, $z, $h);
quest::spawn2(297044,0,0, 125.2-15, -165.3-15, $z, $h);
}

if ($hpevent == 31) {
quest::setnexthpevent(0);
$npc->CastSpell(3230, $mobid);
quest::emote("is filled with rage");
quest::modifynpcstat("atk", 2500);	#was 4000
quest::modifynpcstat("accuracy", 250);	#was 450
quest::modifynpcstat("max_hit", 9100);
quest::settimer("Wave", 20);
}

}



sub EVENT_TIMER {
if ($timer eq "Cleave") {
my $TimeC = quest::ChooseRandom(160,170,180,190,200);
quest::stoptimer("Cleave");
quest::settimer("Cleave", $TimeC);
my $rand = quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40);
if ($rand == 1){quest::spawn2(888600,0,0, 77.8333511352539, -215.798477172852, -6.58549451828003 , 247.625); }
if ($rand == 2){quest::spawn2(888600,0,0, 73.9211578369141, -197.311416625977, -6.58549499511719 , 247.625); }
if ($rand == 3){quest::spawn2(888600,0,0, 69.4454345703125, -176.163909912109, -6.58549451828003 , 247.625); }
if ($rand == 4){quest::spawn2(888600,0,0, 70.037353515625, -151.971374511719, -6.58549499511719 , 1); }
if ($rand == 5){quest::spawn2(888600,0,0, 70.5103912353516, -132.623489379883, -6.58549451828003 , 1); }
if ($rand == 6){quest::spawn2(888600,0,0, 88.1324462890625, -112.005096435547, -6.58549499511719 , 29.5); }
if ($rand == 7){quest::spawn2(888600,0,0, 104.538558959961, -109.15934753418, -6.58549451828003 , 57.375); }
if ($rand == 8){quest::spawn2(888600,0,0, 129.40266418457, -104.845626831055, -6.58549451828003 , 57.375); }
if ($rand == 9){quest::spawn2(888600,0,0, 152.962051391602, -116.422309875488, -6.58549499511719 , 84.875); }
if ($rand == 10){quest::spawn2(888600,0,0, 168.707641601562, -146.771926879883, -6.58549499511719 , 108.5); }
if ($rand == 11){quest::spawn2(888600,0,0, 172.615234375, -171.067642211914, -6.58549451828003 , 121.625); }
if ($rand == 12){quest::spawn2(888600,0,0, 176.814498901367, -197.168869018555, -6.58549642562866 , 121.625); }
if ($rand == 13){quest::spawn2(888600,0,0, 166.318542480469, -215.121444702148, -6.58549499511719 , 150.625); }
if ($rand == 14){quest::spawn2(888600,0,0, 141.030364990234, -231.689041137695, -6.58549404144287 , 180.75); }
if ($rand == 15){quest::spawn2(888600,0,0, 118.095062255859, -225.037750244141, -6.58549642562866 , 203.5); }
if ($rand == 16){quest::spawn2(888600,0,0, 93.8146514892578, -217.998031616211, -6.58549451828003 , 235.375); }
if ($rand == 17){quest::spawn2(888600,0,0, 94.4292907714844, -192.836029052734, -6.58549499511719 , 1.375); }
if ($rand == 18){quest::spawn2(888600,0,0, 95.2122955322266, -160.8291015625, -6.58549642562866 , 1.375); }
if ($rand == 19){quest::spawn2(888600,0,0, 104.862785339355, -136.694183349609, -6.58549642562866 , 15.625); }
if ($rand == 20){quest::spawn2(888600,0,0, 133.518218994141, -131.749282836914, -6.58549499511719 , 59.375); }
if ($rand == 21){quest::spawn2(888600,0,0, 143.506698608398, -156.196029663086, -6.58549642562866 , 112.875); }
if ($rand == 22){quest::spawn2(888600,0,0, 141.997772216797, -188.421615600586, -6.58549499511719 , 130.875); }
if ($rand == 23){quest::spawn2(888600,0,0, 119.676040649414, -213.406127929688, -6.58549499511719 , 167.5); }
if ($rand == 24){quest::spawn2(888600,0,0, 103.811332702637, -187.211395263672, -6.58549547195435 , 234.25); }
if ($rand == 25){quest::spawn2(888600,0,0, 106.236198425293, -165.321426391602, -6.58549499511719 , 4.5); }
if ($rand == 26){quest::spawn2(888600,0,0, 134.978012084961, -148.045059204102, -6.58549547195435 , 97.875); }
if ($rand == 27){quest::spawn2(888600,0,0, 124.244804382324, -180.537612915039, -6.58549499511719 , 141); }
if ($rand == 28){quest::spawn2(888600,0,0, 106.546012878418, -188.907241821289, -6.58549547195435 , 137.625); }
if ($rand == 29){quest::spawn2(888600,0,0, 117.185203552246, -166.387435913086, -6.58549642562866 , 15.875); }
if ($rand == 30){quest::spawn2(888600,0,0, 139.380081176758, -110.880722045898, -6.58549642562866 , 15.875); }
}

	if ($timer eq "Hoof")
	{
		my $TimeA = quest::ChooseRandom(18,19,20,21,22,23,24,25,26,27,28);
		quest::stoptimer("Hoof");
		quest::settimer("Hoof", $TimeA);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(4577);
		}
		#Hoof Stomp
	}

	if ($timer eq "Wave")
	{
		my $TimeB = quest::ChooseRandom(40,45,50);
		quest::stoptimer("Wave");
		quest::settimer("Wave", $TimeB);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(4728);
		}
		#Wave of Rage
	}

if ($timer eq "Speedreset") {
quest::stoptimer("Speedreset");
quest::modifynpcstat("runspeed", 0.0000001);
  }


}
  

sub EVENT_DEATH {
#quest::say ("text");
#quest::emote ("text");
$timestamp = localtime(time);
quest::write("text_files/Tacvi.txt","[$timestamp]:$mname was killed by $name the $class.");
quest::signalwith(297041,1,0);
quest::signalwith(297042,1,0);
quest::signalwith(297043,1,0); 
quest::signalwith(297044,1,0);
quest::delglobal("PXX_Door");
quest::delglobal("PXX_DoorExit");
}



