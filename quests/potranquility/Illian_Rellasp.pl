#Illian_Rellasp.pl
#Force of Akera


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hello $name. Come to enjoy the soothing serenity of this place? The quiet waters remind me of the docks in Erudin when I was a child. It is unfortunate that the tranquility of Quellious does not extend further into the world of Norrath. Every Deepwater Knight yearns for the eternal calm of paradise after a life of faithful service to the gods. Perhaps you have heard of one such knight that achieved transcendence. His name was [" . quest::saylink("Inte Akera") . "] and he is one of the greatest Deepwater Knights to ever live.");
  }
  if($text=~/Inte Akera/i) {
    quest::say("Inte was the first paladin of the Deepwater order to be called to the planes as a servant to the greater gods. While the power of tranquility is fairly well known among the holy orders of paladins in Norrath, few were able to harness the calming power of the ocean into a weapon of order. Inte was one of those holy knights. I can teach this little known magic to you, but I will need a few [" . quest::saylink("things") . "] first.");
  }
  if($text=~/things/i) {
    quest::say("The words of Quellious were the foundation of Inte's magic, I'll need a copy of Quellious' Words of Tranquility. I'll also need the scales of a seahorse blessed by Prexus, the ocean lord, in order to harness the power of the sea. Bring me these things and I will teach you the Power of Inte Akera.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 7687 => 1, 12999 => 1)) {#Spell: Words of Tranquility, Seahorse Scales
    quest::emote("takes the scales and the scroll from you. He takes the scales and grinds them with a mortar and pestle into a fine powder. He begins to speak holy words out over the water and allows the powder to fall into the water. The water begins to glow and bubble. Illian takes the scroll and dips one edge into the water. The water then races up across he parchment and forms into holy runes of Prexus. As the seas calm, Illian turns to you and hands you the scroll. 'May the power of the Prexus guard your journeys $name.'");
    quest::summonitem(59527);#Spell: Force of Akera
  }
  plugin::return_items(\%itemcount);
}#Done