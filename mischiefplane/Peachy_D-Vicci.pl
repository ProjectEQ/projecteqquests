#Zone: Plane of Mischief
#Short Name: mischiefplane
#Zone ID: 126
#
#NPC Name: Peachy D`Vicci
#NPC ID: 126171
# items: 9504, 9505, 9506, 9507, 9508, 9509, 9511, 9512, 9513, 6877

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9504 => 2)) {
    quest::summonitem(quest::ChooseRandom(9505,9506,9507,9508,9509,9511,9512,9513,6877)); # Item(s): Red Gift Box (9505), Blue Gift Box (9506), Green Gift Box (9507), Black Gift Box (9508), Purple Gift Box (9509), White Gift Box (9511), Silver Gift Box (9512), Grey Gift Box (9513), Frostmaidens Idol (6877)
    quest::emote("reaches into her satchel and pulls out a small box.");
    quest::say("Here ya go! Enjoy it. Come back soon. Just a warning though, I cant give you a box that you already have. There isn't enough for everyone you know!");
  }
  plugin::return_items(\%itemcount);
} 