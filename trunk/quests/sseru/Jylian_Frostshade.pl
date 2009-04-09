# Jylian's Research
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, as you can see I am quite busy with my [research]. If you don't mind I need silence to concentrate.");
  }
  if ($text=~/research/i) {
    quest::say("I am researching what went wrong in Mons Letalis. The spires constructed there should allow us passage back to Norrath freely. Upon completion of them something [went wrong].");
  }
  if ($text=~/went wrong/i) {
    quest::say("Suddenly the spires were overwhelmed with eerie beings that seemed to have no essence to them. These spirits now plague the spires. Due to our lack of knowledge of these creatures we do not know how to deal with them. Fighting them seems useless because as soon as one is destroyed more would materialize. They seemed to feed off of death, especially ours. We must [find out more] about them.");
  }
  if ($text=~/find out more/i) {
    quest::say("If you think you can help, I charge you with the task of gathering information. Seek out these creatures, and if you can manage to destroy them bring me their robes. I will study the garment to see if I can determine its origin. Now please, leave me be so that I can get to my research.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29865 => 1)) {
    quest::emote("delicately removes one of the embroidered symbols from the fading robe. Jylian then begins to weave spells to the robe until it becomes fully materialized. 'These robes have unusual symbols all about them. I must study this symbol in greater deatail. Here you can have this robe, I have placed an enchantment on it to keep it from fading from this plane of existence any further. Your service to Seru is appreciated. Now go, I need silence to concentrate.'");
    quest::summonitem(29890);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: sseru ID: 159419 NPC: Jylian_Frostshade

