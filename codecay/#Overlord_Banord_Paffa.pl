my $repeat_flag = 0;

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 30, $x + 30, $y - 30, $y + 30);
}

sub EVENT_ENTER {
    if ($repeat_flag == 0) {
      quest::emote("A deep voice bellows from just ahead saying, 'Come fools see if you can match the power of Banord and his puslings.  Puslings come your master has need of you!' Wretched howls of the twisted puslings begin to echo throughout the room.");
      quest::settimer("paffaa",190);
      $repeat_flag = 1;
    }
}

sub EVENT_TIMER {
  if($timer eq "paffaa") {
    quest::stoptimer($timer);
    quest::emote("A crazed chant echoes through the room as Banord calls for more minions to attack.");
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    
    quest::settimer("paffab",190);
  }
    
  if ($timer eq "paffab") {
    quest::stoptimer($timer);
    quest::emote("A crazed chant echoes through the room as Banord calls for more minions to attack.");
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    
    quest::settimer("paffac",190);
  }
    
  if ($timer eq "paffac") {
    quest::stoptimer($timer);
    quest::emote("A loud and maddened scream of rage is heard as Banord prepares to attack.");
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(quest::ChooseRandom(200003,200004),0,0,$x,$y,$z,$h);
    quest::spawn2(200059,0,0,$x,$y,$z,$h);
    
    quest::depop_withtimer();
  }
}
