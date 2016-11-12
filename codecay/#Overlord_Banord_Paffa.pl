sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 30, $x + 30, $y - 30, $y + 30);
}

sub EVENT_ENTER {
  quest::emote("A deep voice bellows from just ahead saying, 'Come fools see if you can match the power of Banord and his puslings.  Puslings come your master has need of you!' Wretched howls of the twisted puslings begin to echo throughout the room.");
  quest::settimer("paffa_1",190);
  quest::settimer("paffa_2",380);
  quest::settimer("paffa_3",570);
}

sub EVENT_TIMER {
  if($timer == "paffa_1") {
    quest::emote("A crazed chant echoes through the room as Banord calls for more minions to attack.");
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
  }
}

sub EVENT_TIMER {
  if($timer == "paffa_2") {
    quest::emote("A crazed chant echoes through the room as Banord calls for more minions to attack.");
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
  }
}

sub EVENT_TIMER {
  if($timer == "paffa_3") {
    quest::emote("A loud and maddened scream of rage is heard as Banord prepares to attack.");
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(200059),0,0,$x,$y,$z,$h);
    
    quest::stoptimer("paffa_2",190);
    quest::stoptimer("paffa_3",380);
    quest::depop_withtimer(200000);
  }
}
