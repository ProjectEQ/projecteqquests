sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetins to ya friend Dwarf! I've got some of the finest quality steel ores in all the lands! It's a bit troublesome ta keep a large enough supply of it though, it bein sought after by every smith ya know. If you're needin some cash or ore how bout you [run an errand] fer me?");
  }
  if($text=~/run an errand/i) {
    quest::say("I was hopin you'd be up fer the job! Take this here crate and fill it with either Small Bricks of Unrefined Ore or Large Bricks of Unrefined Ore and I'll pay ya when ye return.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10952 => 1)) {
    quest::givecash("0","0","0","14");
    quest::faction("Not_Found","1");
    quest::faction("Not_Found","1");
    quest::faction("Not_Found","-1");
    quest::faction("Not_Found","1");
    quest::faction("Not_Found","1");
  }
  else {
    quest::say("I don't need this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:kaladimb  ID: -- Harnoff_Splitrock