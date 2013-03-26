#Zone: West Karana
#Short Name: qey2hh1
#Zone ID: 12
#
#NPC Name: Konia Swiftfoot
#NPC ID: 12117
#Quest Status: Finished
#

sub EVENT_SAY { 
  if ($text=~/Hail/i) {
    quest::say("Hello there, $name.  I am hosting a relay running contest.  Would you like to participate?");
  }
  if ($text=~/i would like to participate/i) {
    quest::say("Great!  The prize will be this silly old music sheet.  Let me know when you are ready and I will pass you the torch and tell you where the next stop is.");
  }
  if ($text=~/ready/i) {
    quest::say("Here you go.  Run with this torch as fast as you can to the Misty Thicket and hand this torch off to Fajio Knejo.  He will tell you where to go from there.  Hurry!  You do not have much time!");
    quest::summonitem(20532);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20379 => 1)) {
    quest::say("Excellent!  You are quite a runner.  Here is half of the sheet music.  I decided to keep the other half because it has this wonderful signature.  I think it might be quite valuable.  It is probably worth as much as an instrument the great Mahlin used.");
    quest::summonitem(20376);
  }
  if (plugin::check_handin(\%itemcount, 20366 => 1)) {
    quest::say("Mahlin's bongos!  Here, take the other half of the sheet music.  I can't really make out what the signature was, anyway.");
    quest::summonitem(20383);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:qey2hh1  ID:12117 -- Konia Swiftfoot

