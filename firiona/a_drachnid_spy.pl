#The drachnid spy is for the fifth quest in the Greenmist line. Once killed, he'll drop the Charasis Tome that we need.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("looks upon you with evil eyes and you hear a horrid chatter. Hairs rise from the spider's thorax. 'Greetings, creature. What a fine meal you would make!'");
  quest::attack($name);
  quest::say("You shall not take the tome from me!! I shall snack upon your blood-drained corpse.");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(84319,0,0); # NPC: Hero_Goxnok
}

#Submitted by Jim Mills