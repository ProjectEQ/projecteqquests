sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("groans in extreme anguish. '[Help] me.'");
  }
  if ($text=~/help/i) {
    quest::say("My resting grounds have been desecrated. I now lie awake unable to rest with my fellow brethren. My soul is bound to this area for all of eternity. Until my [belongings] are brought back I cannot rest.");
  }
  if ($text=~/belongings/i) {
    quest::say("Many different things were taken, but I'm mainly concerned with my [amulet] and my family's crescent symbol. Bring these articles back into my possession and I'll return back to my state of rest.");
  }
  if ($text=~/amulet/i) {
    quest::say("The amulet was given to me after passing the Trials many many generations ago. It is a part of every soldier who has passed the trials, it is a part of my very being.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,  20605 => 1, 20606 => 1)) {
    quest::say("A Wandering Spirit quickly grabs the amulet and crescent symbol before speaking. 'At long last! I can now rest in peace along with my fellow brethren. Thank you Lanathorn. May the might of Marr follow you wherever you may go.");
    quest::exp(120000);
    quest::ding();
    quest::spawn(208177,0,0,$x,$y,$z); #A Wandering Spirit
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}