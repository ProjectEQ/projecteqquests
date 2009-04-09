# Mining Operation
#

sub EVENT_SPAWN {
  $notecheck = 0;
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Nice to meet you, $name. I have usually the finest mining supplies one can find. However, I am waiting for a shipment so please check back later.");
  }
  if ($text=~/take the mining picks/i && $notecheck == 1) {
    quest::say("Very well then, here are the new mining picks, send Daesorak my regards.");
    quest::summonitem(4755);
    $notecheck = 0;
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4754 => 1)) {
    quest::say("Ah, of course, you must be sent to pick up the supplies that Daesorak has been needing for his mining operation. I was wondering when that crazy Dwarf was going to come and pick these up. I imagine then that you will [take the mining picks] to Daesorak?");
    quest::exp(1000);
    $notecheck = 1;
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: katta ID: 160214 NPC: Terasol

