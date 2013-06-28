# Undead Captain Krignok
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
#
# Popped by rathemtn/Warrior_Spirit_Chalex.pl, after turning in Marr's Promise #67012
# Model is undead troll. Spawns undead troll marauders. Some said 10, someone else said 10 including Krignok.

sub EVENT_SPAWN {
  quest::settimer(1,3); # 5s break for the shouts
  quest::settimer(2,10); # 10s break for the spawns
  quest::settimer(3,12); # 12s break for other spawns
  quest::settimer(4,14); # 14s break for other spawns
  quest::settimer(5,200); # Depop Timer
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::shout("Your beliefs will find you dead by my hands once again frog!");
    quest::stoptimer(1);
  }
  if($timer == 2) {
    quest::emote("'s undead minions shamble towards you slowly, littering the ground with rotting flesh.");
    quest::spawn2(50332,0,0,$x+15,$y+10,$z,$h); # Undead Troll Marauders 00
    quest::spawn2(50332,0,0,$x+20,$y+5,$z,$h); # Undead Troll Marauders 01
    quest::spawn2(50332,0,0,$x+20,$y+15,$z,$h); # Undead Troll Marauders 02
    quest::stoptimer(2);
  }
  if($timer == 3) {
    quest::spawn2(50332,0,0,$x+15,$y-10,$z,$h); # Undead Troll Marauders 03
    quest::spawn2(50332,0,0,$x+20,$y-5,$z,$h); # Undead Troll Marauders 04
    quest::spawn2(50332,0,0,$x+20,$y-15,$z,$h); # Undead Troll Marauders 05
    quest::stoptimer(3);
  }
  if($timer == 4) {
    quest::spawn2(50332,0,0,$x+25,$y,$z,$h); # Undead Troll Marauders 06
    quest::spawn2(50332,0,0,$x+30,$y+5,$z,$h); # Undead Troll Marauders 07
    quest::spawn2(50332,0,0,$x+30,$y-5,$z,$h); # Undead Troll Marauders 08
    quest::stoptimer(4);
  }
  if($timer == 5) {
    quest::depop();
    quest::stoptimer(5);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("I yield Chalex, you are truly a worthy opponent.");
  quest::emote("falls to the ground. Images of the dead whip around the air as Krignok returns to the spectral world taking any of his remaining minions with him."); #Text modified as quest::echo not working
  quest::signal(50332,3);   ##signal troll marauders to depop
}