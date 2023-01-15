# items: 1782, 1783, 17059, 1786, 19469
sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::emote("appears to fade in and out. The ghostly figure seems to stare through you, as though he is not aware of your presence.");
   quest::say("Do you know who I am?");
   quest::emote("asks, as if he is inquiring for his own benefit.");
  }
  if($text=~/who are you/i) { 
   quest::emote("begins to smile.");
   quest::say("It has come back to me, just now. I am the Dragon Sage. I lived in the once great elven city of Takish Hiz, where I studied the dragons of Norrath.");
   $client->Message(0,"The figure appears to be concentrating on something in the distance. His image begins to fade as he says,");
   quest::say("If I am among the world of the living again, then Norrath must be in great [danger].");
  }
  if($text=~/danger/i) {
   quest::say("Thousands of years ago, Veeshan, the mother of all wurms, made her mark upon the face of a young world called Norrath. She struck the planet with her godly might, laying her claim to the world, and created the beings known as dragons. This began the [Age of Scale].");
  }
  if($text=~/age of scale/i) {
   quest::say("The Age of Scale was the time when dragons ruled supreme. They controlled the lands, the sea, and the sky for some 3000 years. That was when [other gods] took notice.");
  }
  if($text=~/other gods/i) {
   quest::say("Tunare, the Mother of All, Prexus, the Oceanlord, and Brell Serilis, the Duke of Below formed a pact in response to Veeshans claim to Norrath. The elves, the dwarves, and the aquatic kedge were all created to help keep the dragons in check. Rallos Zek, the Warlord, learned of this pact and created the giants. This began the [Elder Age].");
  }
  if($text=~/elder age/i) {
   quest::say("The Elder Age was the time of the first humanoid races, the oldest on Norath, next to the dragons. The elves prospered, while the giants struggled to survive. The giants on the frozen continent of Velious were in constant skirmishes with the dragons. It was at this point that the [observations] began.");
  }
  if($text=~/observations/i) {
   quest::say("The giants, smarter than expected, began watching and observing the habits of the dragons. They paid close attention to the things the dragons avoided... certain plants and watering holes. It was determined that a particular type of [plant], when mixed with other reagents, was deadly to the dragons. The giants adapted their technique to specifically harm Yelinaks brood in order to give them an advantage. The ancient Kromzek king, Porlos, used this to aid in his battle with Hsagra, Yelinaks mate. Porlos killed Hsagra, forever bringing Yelinaks vengeance upon his family. Thus began the eternal war between the giants and the dragons.");
  }
  if($text=~/plant/i) {
   quest::say("The name of the plant eludes me at this time, for my thoughts have grown cold through the ages. The findings of the giants were written in a book of lore by some of our sages. You should seek out one of the giants Tomekeepers. If you find a Tomekeeper, ask him about the herb that harms dragons. Perhaps if you give him this trinket he will assist you. Maybe they will remember my tired soul.");
   quest::summonitem(1782); #Giant Loyalist Token
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1783 => 1)) { #Giant Scalebound Tome
    quest::emote("takes the guide and immediately begins to scan through it. He then says,");
    quest::say("Ah... Ah yes... According to this book, the dragonbane herb grows only in one place, deep inside the lair of the sirens. If my memory serves me properly one of the creatures there is very fond of its flavor. I will also need the blood of a dragon, but not just any dragon. The blood must come from a beast of Lord Yelinaks bloodline. Please go now and see if you can find this herb and the dragon blood. No time to waste, child. You will need to take this box to contain and combine the herb and blood in. Once you have accomplished this, please return the box to me.");
    quest::summonitem(17059); #Ornate Reagent Box
  }
  elsif(plugin::check_handin(\%itemcount, 1786 => 1)) { #Sealed Reagent Box
    quest::say("Ahhh! With the knowledge that I have gained from the Giant Scalebound Tome and these reagents, I can finish my research and create a most powerful spell for you! If successful, I will call it the Porlos Fury spell. It will cause near fatal wounds to any dragon or dragon kin in Lord Yelinaks bloodline. Take this and study it. The magiks contained within will aid you in your fight.");
    quest::emote("hands you the scroll and says,");
    quest::say("You will need a reagent to channel the magical energies through to enhance the power of the spell. Two peridots will be required to cast this spell. I wish you good fortune in your fight.");
    quest::summonitem(19469); #Porlos' Fury
  } 
  plugin::return_items(\%itemcount);
}

#EOF