#Quests covered in this file:
#Shaman Skull Quest 8

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
      quest::emote("Oracle Vauris motions for silence and points at the shifting sands below him without a word.");
   }
   if($text=~/What Rile?/i && $shmskullquest >= 13 && $faction <= 5)
   {
      quest::say("Have you learned nothing in all your years of service to the hall of Terror? The skulls on that necklace were the bones of the traitorous Iksar who defiled Rile's Relics. Their final moments were spent in Charasis, destroyed by their own dark magics. Rile was the son of the most powerful and terrible [emperor] the Iksar have ever known. Not since the days of Ssrae... 'His voice trails off and his eyes glaze over a bit. You sense that Vauris has been touched by some unmentionable terror.");
   }
   if($text=~/What emperor?/i && $shmskullquest >= 13 && $faction <= 5)
   {
      quest::say("At last you see Cradossk. The one you speak of is indeed a servant of Rile's father. His presence on this world has disrupted the spirits of the ancients. This disruption must be put to an end. Slaying him will do little good unfortunately. We will have to make use of other powers to truly banish him from this world. If we are to do this we shall need a true relic of Rile, and the soul of his father. Only with these items can we hope to free Rile's soul from the void between death and life. But first there are others that serve the risen emperor that must be destroyed.");
   }
   if($text=~/What others?/i && $shmskullquest >= 13 && $faction <= 5)
   {
      quest::say("The servants of the emperor wear many faces. One in particular is know to wear several himself. Of Serpents and Iksar is his current incarnation, a twisted vision of a dark union. Bring me his essence, for I will need a vessel to siphon the emperor's soul into. Bring me these 3 items along with the pouch of bone dust and we shall see what fate the ancients have chosen for us.");
   }
}

sub EVENT_ITEM
{
   #Turn in the Shrunken Iksar Skull Necklace
   if(plugin::check_handin(\%itemcount, 30989 => 1) && $faction <= 5 && $shmskullquest >= 13)
   {
      quest::emote("Vauris looks into your eyes for a moment. He seems to be searching for something. Apparently he finds whatever he was looking for as he pulls an empty bag from his belt. He takes the necklace and snaps the cord with his teeth allowing the skulls to fall into the bag. He looks you square in the eyes again and motions for you to put out your hand. You do so and almost immediately regret it. Vauris takes the knife from his belt and slices open your forearm allowing your blood to fall into the bag. He uses the cord to tie the bag and hands it back to you.");
      quest::say("You now share the mark of Rile, Cradossk. Your fates are intertwined.");
      quest::summonitem(30990); #give the player Bag of Iksar Skull Dust
   }

   #Turn in the Changeling Essence, Bag of Iksar Skull Dust, Glowing Kunzar Amulet, Blackened Iksar Bones
   if(plugin::check_handin(\%itemcount, 30991 => 1, 30990 => 1, 30993 => 1, 30992 => 1) && $faction <= 5 && $shmskullquest >= 13)
   {
      quest::say("You have done well $name. Now it is time for the true test of your clairvoyance. Only a true Scaled mystic will be able to put these spirits to rest. Be warned, these souls will not go quietly into the next world. They have strong ties to this land, and it is these ties we must break. Take them to the City of the Kunzar, the birthplace of the emperor. Only there will you be able to tear asunder the dark rituals that have twisted the souls of our ancient heroes. I will await you in that place $name.");
      quest::summonitem(30994); #give the player Iksar Relics
   }
  plugin::return_items(\%itemcount);
}