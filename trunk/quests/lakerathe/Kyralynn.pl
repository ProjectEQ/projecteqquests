# Quest for 51058 Kyralynn in Lakerathe - Shaman Totemic Armor (low 30's armor)
# Kiladiveus - completed subevents for this NPC quest.  I created the ending statement since i can't find any. Same as exp.
# Kiladiveus - In OOT, need to add loot "19035 Driftwood pipe" into "69148 isle goblin chieftan" need also to create lootdrop ID.
# Kiladiveus - In southkarana, need to add loot "19044 Grizzleknot Bark" into "14142 Grizzleknot" with 100% probability. Npc already a rare spawn.      


sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Hello. $name! I am the shaman Kyralynn. If you have a banded armor, my husband Vrynn and I can form it into a new shaman armor using this totem and some reagents for the ritual. I can use a banded [bracer], [mail], [helm] or [cloak] to form this new armor.");
  }
  if($text=~/bracer/i){
    quest::say("The bracer requires a banded bracer, 1 dufrenite, a cauldron shell from an aqua goblin lord in Dagnor's Cauldron, and a bull elephant tooth.");
  }
  if($text=~/helm/i){
    quest::say("The helm requires a banded helm, 1 ground dufrenite, a glacier bear pelt, and an ogreskin chamois from a lizard page.");
  }
  if($text=~/cloak/i){
    quest::say("The cloak requires a banded cloak, 1 powdered dufrenite, basalt drake scales, and a driftwood pipe from an isle goblin chieftain.");
  }
  if($text=~/mail/i){
    quest::say("The mail requires banded mail, 1 crushed dufrenite, a lancer swordfish fin, and Grizzleknot bark.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 3061 => 1, 10073 => 1, 19031 => 1, 19033 => 1)) {
    quest::exp(200);
    quest::summonitem(4945);
    quest::say("I have crafted your bracer, use it well.");
  }
  elsif (plugin::check_handin(\%itemcount, 3053 => 1, 19051 => 1, 19042 => 1, 19040 => 1)) {
    quest::exp(200);
    quest::summonitem(4947);
    quest::say("I have crafted your helm, use it well.");
  }
  elsif (plugin::check_handin(\%itemcount, 3058 => 1, 19052 => 1, 19032 => 1, 19035 => 1)) {
    quest::exp(200);
    quest::summonitem(4948);
    quest::say("I have crafted your cloak, use it well.");
  }
  elsif (plugin::check_handin(\%itemcount, 3056 => 1, 19050 => 1, 19036 => 1, 19044 => 1)) {
    quest::exp(200);
    quest::summonitem(4946);
    quest::say("I have crafted your breastplate, use it well.");
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:lakerathe  ID:51058 -- Kyralynn