#Zone: Plane of Mischief
#Short Name: mischiefplane
#Zone ID: 126
#
#NPC Name: Bob the Painter
#NPC ID: 126268
# items: 18008, 17326

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18008 => 1)) {
    quest::summonitem(17326); # Item: Empty Pot of Gold
    quest::say("Ay!!! this is poifect! 'ere take this pot o' gold. It's empty at the moment. Go ask my brother Vinny about the pot and mebbe he'll have a clue how ta get it full agin.");
  }
   plugin::return_items(\%itemcount);
} 