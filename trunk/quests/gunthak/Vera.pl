#zone: gunthak - NPC Vera (224192)
#Started by Angelox, finished by Kilelen
#Primal Remedy/Elemental Empathy

sub EVENT_SAY { 
	if ($text=~/Hail/i){
		if ($class eq "Magician") {
  		quest::say("Why hello there. It's quite a sunny day out here upon the rocks of Broken Skull, wouldn't you agree? It's nowhere near as hot as the temple of Solusek Ro, though. The breeze here is quite refreshing. To be honest, though, I already miss home and wish to return back as soon as I can. These pirates are quite dirty and smelly, but I must complete my [mission] before I return home.");
  	}
  	else {
  		quest::emote("nearly jumps out of her skin as you address her.  She spins around wildly, spilling ink all down the front of her robe.");
  		quest::say("Oh look what you've done! I had kept my robe so clean the entire trip here too!");
  		quest::emote("walks away mumbling while she tries to blot out the ink with an old rag.");
  	}
 	}
 	if ($text=~/mission/i){
 		quest::say("My twin sister, Vira, has developed quite an illness and is confined to her quarters back in the temple. The clerics are baffled by it. At one moment she is hot and raging to the touch and the next she is as cold as the deep sea. If such an illness is impossible for the priests to cure, I must cure her in the only way I know how. I came out here to investigate the way the waters of Gunthak cool the hot lava coming from under the volcano of Broken Skull. The mixing of these two elements sometimes causes powerful elementals to manifest themselves here. I have a feeling that, by mixing the elements of the sea and the elements of the lava, I can make a potion that will soothe my sister. [Will you help] me?");
 	}
 	if ($text=~/will help you/i){
 		quest::say("Wonderful! The luggalds of this area make sport of the elementals that are birthed here. They take the life flickers of these elementals for hateful sacrifice to their foul god. Go and dispatch these followers of hate and return to me a flicker of lava and a flicker of sea. Please hurry! I know not how long my sister can hold out!");
 	}
 	if ($text=~/more assistance/i){
 		quest::say("Thank you. Apparently, from rumors I have heard here in the lighthouse, the luggalds use some form of serum to harness the minds of the pirates and make them into slaves. Not only do they control the slaves, but they have also found a way to make them stronger. I suspect if you could get me some of the substance that the luggalds use to stoke the flames of strength in their slaves, I could find a way to transform it into a form we could use on the elementals of our craft. Are you willing to take a chance and make a [dangerous journey]?");
 	}
 	if ($text=~/dangerous journey/i){
 		quest::say("Then journey deep into the mines of Torgiran and look for an elemental power on luggalds in the mines. Bring me three of the elements they use. I suspect they harness its power from the giant seam of lava splitting the mines.");
 	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 58001 => 1, 58002 => 1)) {#Flicker of Lava, Flicker of Sea
    quest::emote("takes the flickers from you, places them in a metal brazier and begins to chant in a deep rumbling tone. After a few moments of chanting, the flickers coalesce into one and form a pale, light blue liquid in the bottom of the brazier. Vera picks up a vial, corks half the substance within, and hands it to you. 'Wonderful! This should do the trick. Take this vial to my sister, Vira, in the Temple of Solusek Ro. I would make the trip, but I have discovered something I must investigate further.' ");
    quest::summonitem(58003);#Vial of Liquid
  }	
  elsif(plugin::check_handin(\%itemcount, 58004 => 1)){#Note to Vera
    quest::say("Thank goodness my sister is feeling better. While you were gone, I was able to figure out the exact healing power of the flicker liquid. I have transcribed it on this piece of parchment. Here, memorize this and may it serve you well. Now, if I can just figure out what sustains the lava elementals of Broken Skull. If you are up to it, I could use some [more assistance].");
    quest::summonitem(59017);#Spell: Primal Remedy
    quest::exp(1750000);#1% of level 51 xp
  }
  elsif(plugin::check_handin(\%itemcount, 58005 => 3)){#Strength of Lava
    quest::emote("takes the components from you and again puts them in her brazier. She begins a chant and raises her arms towards the sky. As she chants, the elements in the brazier light up brightly and begin to fragment. As they drift skyward they form into patterns of archaic runes. Vera's chant forces the runes into a pattern. The pattern is burned into your vision, even when you close your eyes. Knowing that the runes will fade, you quickly pluck up a pen and parchment to jot the runes down. Vera's chant fades and the night grows dark again. She looks over your parchment and says, 'Let me translate that into something useful for you.'");
    quest::summonitem(58006);#Scribed Runes
    quest::exp(1750000);#1% of level 51 xp
  }	
  elsif(plugin::check_handin(\%itemcount, 58006 => 1)){#Scribed Runes
    quest::emote("makes a copy of your parchment, adding some extra symbols at the end. 'See, I told you it would be useless to you until I translated it. I shall journey home, now, and place this new scroll within the libraries of Solusek. I thank you for your help and wish you hearty adventures.'");
    quest::summonitem(59018);#Spell: Elemental Empathy
  }	
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
}#Done