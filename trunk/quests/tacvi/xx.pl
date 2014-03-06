#First Tacvi Boss
#4577 hoof tample
#4728 Wave of rage
#4729 Spirit Cleaver

sub EVENT_COMBAT {

  if ($combat_state == 1) {
#quest::say("You dare enter our sacred nesting grounds!");
quest::emote("stomps her hoofs with rage");
quest::setnexthpevent(90);
quest::settimer("Hoof", 15);
#Snare#$npc->CastSpell(512, $mobid, -1);
}

if ($combat_state == 0) {
quest::modifynpcstat("runspeed", 0.0000001);
$npc->SetHP($npc->GetMaxHP() * 1);
#quest::settimer("Root", 30); 
quest::emote("calms down");
quest::stoptimer("Hoof"); 
quest::stoptimer("Wave");
$npc->WipeHateList();
quest::depopall(297041);
quest::depopall(297042); 
quest::depopall(297043);
quest::depopall(297044); 
quest::spawn2(297039,0,0, 125.2, -165.3, -6.5, 189.1);
quest::depop();
}
}

sub EVENT_HP  { 

if ($hpevent == 90) {
quest::setnexthpevent(50);
$npc->BuffFadeBySpellID(512);
quest::modifynpcstat("runspeed", 1);
quest::emote("stomps her hoofs wildly");
}

if ($hpevent == 50) {
quest::setnexthpevent(30);
quest::spawn2(297041,0,0, 125.2+15, -165.3+15, $z, $h);
quest::spawn2(297042,0,0, 125.2-15, -165.3+15, $z, $h);
quest::spawn2(297043,0,0, 125.2+15, -165.3-15, $z, $h);
quest::spawn2(297044,0,0, 125.2-15, -165.3-15, $z, $h);
}

if ($hpevent == 30) {
quest::setnexthpevent(0);
$npc->CastSpell(3230, $mobid);
quest::emote("is filled with rage");
quest::modifynpcstat("atk", 1000);	#was 2500
quest::modifynpcstat("accuracy", 0);	#was 200
quest::modifynpcstat("max_hit", 6500);
quest::settimer("Wave", 20);
}

}



sub EVENT_TIMER {

	if ($timer eq "Hoof") {
		my $TimeA = quest::ChooseRandom(18,19,20,21,22,23,24,25,26,27,28);
		quest::stoptimer("Hoof");
		quest::settimer("Hoof", $TimeA);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(4577);
			#Hoof Stomp
		}
	}

	if ($timer eq "Wave") {
		my $TimeB = quest::ChooseRandom(40,45,50);
		quest::stoptimer("Wave");
		quest::settimer("Wave", $TimeB);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(4728);
			#Wave of Rage
		}
	}

}
  
sub EVENT_SIGNAL {

#ATK
if ($signal == 1) {
$entity_list->MessageClose($npc, 1, 200, 15, "Val'Tsara is strengthend by the goblin's prayer . ");
$ValATK = $ValATK + 25;	#was 50
quest::modifynpcstat("atk", $ValATK);
#$npc->CastSpell(7045, $mobid);
}

#Accuracy
if ($signal == 2) {
$entity_list->MessageClose($npc, 1, 200, 15, "Val'Tsara jaws begin to snap with greater accuracy");
$ValAcc = $ValAcc + 50;	#was 100
quest::modifynpcstat("accuracy", $ValAcc);
$npc->CastSpell(207, $mobid);
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
}


