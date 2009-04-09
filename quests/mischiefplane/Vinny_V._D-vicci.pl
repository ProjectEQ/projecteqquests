#Zone: Plane of Mischief
#Short Name: mischiefplane
#Zone ID: 126
#
#NPC Name: Vinny V. D'vicci
#NPC ID: 126277

sub EVENT_SAY {
  if ($text=~/pot of gold/i) {
    quest::say("Pot o` gold? Bwahahahaha! Only pot around is them ones I warsh my clothes in. Gotta be careful though, one time I dropped one of dem woids of wealth in and BADABING no clothes jus a stinkin coin that wouldn't buy me a fishin grub.");
} 
 }