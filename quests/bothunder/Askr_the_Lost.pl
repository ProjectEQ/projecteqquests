sub EVENT_SAY {
   if($text=~/hail/i)   {
	quest::emote("looks down at the fallen corpses at his feet and begins to mumble quietly, 'Karana help me, I had no idea. I am sorry Rainkeeper, I have truly failed you. I must find a way to rouse him from his [slumber].'");
   }
   if($text=~/slumber/i)   {
	quest::say("The Rainkeeper lies in deep meditation at the top of the great tower, Torden. His meditations have some how become tainted by a force from outside the plane. He lies in his tower besieged by all manner of dark visions and dreamscapes. I cannot fathom the focus it must take to discern the clairvoyance that the Rainkeeper controls. It is surely his fitful sleep that has caused this turmoil to reign here. You must [gain entrance] to Torden, $name.");
   }
   if($text=~/gain entrance/i)   {
	quest::say("An ethereal seal that is protected by the collective power of the lightning, blizards, tornadoes, and sandstorms guards the tower. You must collect the essence of these storms in order to create the key that will allow you to enter the tower of Torden. But first you must earn the right to enter the [courtyard] of the Bastion. From there you will be able to find the storm essences.");
   }
   if($text=~/courtyard/i)   {
	quest::say("The courtyard will allow you access to the four greater towers as well as Torden itself. The strongest giants of the lower halls most likely hold the key that you will need to enter the courtyard. Be wary of the giants in this stronghold $name, the each hold a piece of the great power of the Rainkeeper, unbridled by his control and wisdom.");
   }
}

#End of File zone:bothunder ID: unassigned -- Askr the Lost
#By Kovou