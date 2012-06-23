##Gwaddry Aethadoc.pl
#Gwaddry's Problem

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Get out of my way mortal, you have no business with me unless you [wish disposal of the fire demons].");
  }
  if($text=~/wish disposal of the fire demons/i) {
    quest::say("Well then $name, you might be of service to me after all. I seek some brave soldiers to strike back at the servants of Nagafen that have been chosen to guard his hordes of treasure. They need to be cut down so that we may claim what is rightfully ours. Do you wish to [strike back at the minions of Nagafen]");
  }
  if($text=~/strike back at the minions of nagafen/i) {
    quest::say("Very well, I will need you to collect me 4 items for an incantation I have been working on. My limited area that I am forced to reside in has prevented my practice of magic so I have been restricted to concocting alchemy potions. When you are [ready] I will have you [gather the components] I need for my potion.");
  }
  if($text=~/ready to gather the components/i) {
    quest::say("As I said before I require 4 important components for my recipe. They all must be taken from the beasts that reside in the deepest parts of these caverns. Return to me when you have gathered 1 Fireback Silk, 1 Sweltering Slime Bauble, 1 Fireborn Tooth and 1 Blistering Tentacle.");
  }
  if($text=~/bigger problem/i) {
    quest::say("I do feel that you have no problem assisting me with any items I may need, but what I am about to ask you to do could put my life in jeopardy. Let me begin by telling you how I lost my sacred [family totem].");
  }
  if($text=~/family totem/i) {
    quest::say("The totem I speak of has been in my family for 5 generations, that is until I lost it recently in a battle to hold back the forces of the Taklasinai. I wish to regain my totem so that I may use it to do the [unspeakable].");
  }
  if($text=~/unspeakable/i) {
    quest::say("For years I have sat here in this dwelling unable to practice my magic at the fault of the Vrodak. I no longer wish to be confined to this space and want to be free. The only way I will not die where I stand is to pledge allegiance to the Taklasinai. I feel if I seek council before their leaders they will agree to use my ranking as a way to infiltrate the Vrodak defenses and eventually cause the Vrodak clan to crumble. Before I can free myself I will need my magical family artifact. If you will [collect the pieces of my totem] I will reward you greatly.");
  }
  if($text=~/collect the pieces of your totem/i) {
    quest::say("Very well $name, I wish you luck in obtaining the pieces to my family totem so I can once again reconstruct it. When it was lost it was broken into 3 pieces; A hilt, a base and a collection of runes that were engraved into it. Should you return these 3 pieces to me along with my trinket, I can once again construct the totem and free myself from this area to seek council with the Taklasinai. Please hurry $name, if word gets out that I am planning a revolt against my own people I will be killed for sure.");
  }
}
 
 
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 61230 => 1, 61231 => 1, 61232 => 1, 61233 => 1)) {#Fireback Silk, Sweltering Slime Bauble, Fireborn Tooth, Blistering Tentacle
    quest::say("Well I see that you can certainly be trusted to uphold my will should I request it of you. Please take this symbol and return to me if you should desire to help me with a much [bigger problem].");
    quest::summonitem(61237); #Gwaddry's Trinket
  }
 
  if(plugin::check_handin(\%itemcount, 61237 => 1, 61235 => 1, 61234 => 1, 61236 => 1)) {#Gwaddry's Trinket, Burning Totem Base, Burning Totem Hilt, Sweltering Totem Runes
    quest::say("Take this, $name.  I go to do the unspeakable now.");#Nobody ever bothers to record the final dialog anymore.  They're always so stoked they found and completed a new quest, they get all excited and don't bother with the last thing the mobs says.  Frustrating.  This is completely made up, I'm sorry. =\
    quest::summonitem(61238); #Flame Etched Cloak
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
   
}#Done
