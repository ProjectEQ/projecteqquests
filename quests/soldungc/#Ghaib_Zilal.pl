##Ghaib_Zilal.pl
#Aid Ghaib against the Kobolds

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Quiet, fool. The pathetic kobolds know not of my presence and I'd like to keep it that way. Though, I was hoping someone with your strength would come along. I am in need of your [aid].");
  }
  if($text=~/aid/i) {
    quest::say("I've infiltrated this, the latest stronghold of the servants of Solusek Ro, to find a way to cast them out before they grow too strong. My excursions into the deeper caverns have led me to an answer, but I alone cannot retrieve what I require. If you [lend me your strength], I will in turn help you in your own destruction of our mutual foes.");
  }
  if($text=~/lend you my strength/i) {
    quest::say("Excellent. Deeper within these caves lie many fierce denizens of flame. The kobolds fear them and rightly so for many dogs have fallen to the pure elemental might these creatures control. By harnessing this power, I believe I can produce a temper that once infused into a weapon will allow the owner to wield the very essence of fire itself. To create this temper, though, I need [raw materials].");
  }
  if($text=~/raw materials/i) {
    quest::say("I need the very essence of the fire creatures that make their home here: pieces of flesh, drops of blood, fluids, bone or whatever else you can find that still radiates heat long after the creature is destroyed. I'll need parts from four different types of creatures to produce the temper. We've spoken long enough. You must go before you alert the kobolds to my presence. Return to me only once you have the materials.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 55253 => 1, 55256 => 1, 55254 => 1, 55255 => 1)) {#A Smoldering Tentacle, Seared Imp's Blood, Seared Ooze, Crystallized Soul of Fire
    quest::say("Quite excellent.  The kobolds have found pieces of a sword that was undone.  Bring me the three pieces along with this vial, and I will remake the blade.");#text made up
    quest::summonitem(55260); #Flame-Forged Vial
  }
  
  if(plugin::check_handin(\%itemcount, 55260 => 1, 55257 => 1, 55258 => 1, 55259 => 1)) {#Flame-Forged Vial, Melted Hilt, Shattered Blade (Top), Shattered Blade (Bottom)
    quest::say("Amazing.  This should serve you well, take it and slaughter our mutual enemies, $name!");#text made up
    quest::summonitem(55261); #Ghaib's Flame-Forged Longsword
  }
  plugin::return_items(\%itemcount);
}#Done