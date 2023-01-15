# items: 13073, 13019, 13050
sub EVENT_SAY{
  if ($text=~/hail/i){
  quest::say("Greetings! Have you anything for me? Don't look at me like that, you know what I mean. Odds and ends from out there in the swamp. Rat parts are fine, and I could always use some freshly caught fish.");
  }
}

sub EVENT_ITEM {
  if($qglobals{darcollect} == undef && plugin::check_handin(\%itemcount, 13073 => 4)){
  quest::say("Thank you!");
  quest::setglobal("darcollect",1,2,"D30");
  quest::faction(1719, 4); # Faction: Citizens of Gukta
  quest::faction(1718, 4); # Faction: Guktan Elders
  quest::faction(1716, 4); # Faction: High Council of Gukta
  quest::faction(1717, 4); # Faction: Lorekeepers of Gukta
  quest::faction(1709, 4); # Faction: Protectors of Gukta
  quest::exp(100);
  quest::ding();
  }
  if($qglobals{darcollect} == 1 && plugin::check_handin(\%itemcount, 13073 => 4)){
  quest::say("I'm going to need some fish now.");
  quest::setglobal("darcollect",2,2,"D30");
  quest::faction(1719, 4); # Faction: Citizens of Gukta
  quest::faction(1718, 4); # Faction: Guktan Elders
  quest::faction(1716, 4); # Faction: High Council of Gukta
  quest::faction(1717, 4); # Faction: Lorekeepers of Gukta
  quest::faction(1709, 4); # Faction: Protectors of Gukta
  quest::exp(100);
  quest::ding();
  }
  if($qglobals{darcollect} == 2 && plugin::check_handin(\%itemcount, 13019 => 4)){
  quest::say("Thank you!");
  quest::setglobal("darcollect",3,2,"D30");
  quest::faction(1719, 4); # Faction: Citizens of Gukta
  quest::faction(1718, 4); # Faction: Guktan Elders
  quest::faction(1716, 4); # Faction: High Council of Gukta
  quest::faction(1717, 4); # Faction: Lorekeepers of Gukta
  quest::faction(1709, 4); # Faction: Protectors of Gukta
  quest::exp(100);
  quest::ding();
  }
  if($qglobals{darcollect} == 3 && plugin::check_handin(\%itemcount, 13019 => 4)){
  quest::say("I'm going to need some rat ears now.");
  quest::setglobal("darcollect",4,2,"D30");
  quest::faction(1719, 4); # Faction: Citizens of Gukta
  quest::faction(1718, 4); # Faction: Guktan Elders
  quest::faction(1716, 4); # Faction: High Council of Gukta
  quest::faction(1717, 4); # Faction: Lorekeepers of Gukta
  quest::faction(1709, 4); # Faction: Protectors of Gukta
  quest::exp(100);
  quest::ding();
  }
  if($qglobals{darcollect} == 4 && plugin::check_handin(\%itemcount, 13050 => 4)){
  quest::say("Thank you!");
  quest::setglobal("darcollect",5,2,"D30");
  quest::faction(1719, 4); # Faction: Citizens of Gukta
  quest::faction(1718, 4); # Faction: Guktan Elders
  quest::faction(1716, 4); # Faction: High Council of Gukta
  quest::faction(1717, 4); # Faction: Lorekeepers of Gukta
  quest::faction(1709, 4); # Faction: Protectors of Gukta
  quest::exp(100);
  quest::ding();
  }
  if($qglobals{darcollect} == 5 && plugin::check_handin(\%itemcount, 13050 => 4)){
  quest::say("I'm going to need some bone chips now.");
  quest::delglobal("darcollect");
  quest::faction(1719, 4); # Faction: Citizens of Gukta
  quest::faction(1718, 4); # Faction: Guktan Elders
  quest::faction(1716, 4); # Faction: High Council of Gukta
  quest::faction(1717, 4); # Faction: Lorekeepers of Gukta
  quest::faction(1709, 4); # Faction: Protectors of Gukta
  quest::exp(100);
  quest::ding();
  }
  else{
  plugin::return_items(\%itemcount);
  }
  $qglobals{darcollect} = undef;
}
