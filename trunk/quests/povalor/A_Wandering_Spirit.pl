#############
#NPC:  Wandering Spirit
#Author: Spre
#Version: 0.0.1
#EQEMUV: 6.2+
#############
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("A Wandering Spirit groans in extreme anguish. [Help] me.");
  }
  if ($text=~/help?/i) {
    quest::say("My resting grounds have been desecrated. I now lie awake unable to rest with my fellow brethren. My soul is bound to this area for all of eternity. Until my [belongings] are brought back I cannot rest.");
  }
  if ($text=~/belongings/i) {
    quest::say("Many different things were taken, but I'm mainly concerned with my [amulet] and my family's crescent symbol. Bring these articles back into my possession and I'll return back to my state of rest.");
  }
  if ($text=~/Amulet/i) {
    quest::say("The amulet was given to me after passing the Trials many many generations ago. It is a part of every soldier who has passed the trials, it is a part of my very being.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,  20605 => 1, 20606 => 1 )) {
   quest::say("A Wandering Spirit quickly grabs the amulet and crescent symbol before speaking. 'At long last! I can now rest in peace along with my fellow brethren. Thank you Lanathorn. May the might of Marr follow you wherever you may go.");
   quest::exp(120000); #no exact amount known by me.
   quest::ding();
   quest::spawn(208177,0,0,$x,$y,$z); # Live Wandering spirit hand in 2 other items for secret EXP
   quest::depop();
   }
else {
    quest::say("I don't need this.");
    plugin::return_items(\%itemcount);
  }
}
