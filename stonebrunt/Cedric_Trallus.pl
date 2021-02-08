#NPC: Cedric_Trallus
#NPC ID: #100129
#Zone: stonebrunt
#Quest by Dave
# items: 59035, 59019, 59006, 59050, 59036, 59051, 59037

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello $name, chancing a journey to Brokenskull are you? Many have ventured there, but few have returned. I was favored by the will of Thule to return here in one piece, although I would not call my [journey] exactly successful.");
  }
  if($text=~/journey/i) {
    quest::say("Our spies in Erudin were able to learn that a voyage of Deepwater knights was setting sail in search of Brokenskull Island. Our priests in Paineel had received several visions from the lord Cazic telling of great powers that might be found on this island. Our group was instructed to follow their ship across the waters and explore the island should we find it. Find it they did, and more then they ever bargained for on that [cursed isle].");
  }
  if($text=~/cursed isle/i) {
    quest::say("Just as the Deepwater knights were about to drop anchor near a small cove on the island, we attacked them. The magic cloaks we had placed over our ship did their job all too well. We took them by surprise and our forces easily overpowered them, but our battle was joined by a [third force].");
  }
  if($text=~/third force/i) {
    quest::say("A group of strange creatures crawled up the side of the boats and began to attack everyone on both sides. They cut through many of us before we were able to retreat our forces back to our ship and turn our sails away from the island. Several of the creatures pursued us through the water with amazing speed. We fought them off and we forced them back into the sea. We were able to slay one of them, or so we thought. We brought the [body] back to Paineel for the priests to study.");
  }
  if($text=~/body/i) {
    quest::say("When we docked here in Paineel we were carrying the body off of the ship when suddenly the creature came to life. It threw several of our knights into the water and then jumped in himself and swam off into the ocean. We suspect that it used some form of magic to fool us into believing it was actually dead. The necromancers of Paineel are not easily fooled in matters of life and death. We greatly desire to study the [organs] of these creatures to learn the secret of this new magic.");
  }
  if($text=~/organs/i) {
    quest::say("Bring me two samples of these creatures internal organs for our priests to study and we may share the secret of their magic with you. Something tells me you won't come back alive, though.");
  }
  if(($text=~/robes/i) && (defined($qglobals{luggald}) && ($qglobals{luggald} == 1))) { # Part 2
    quest::emote("glances at the burns in his robes inquisitively.");
    quest::say("It seems an aspect of the luggald's system is acidic in nature. Perhaps we have yet to find the secret of their comatose state. I'll need more samples to continue my research. This time bring me purified samples of their bile, blood, and saliva and I will study them.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 59035 => 2)) { #Luggald Organs
    quest::setglobal("luggald",1,0,"F");
    quest::emote("takes the organs from you and lays them down on the ground before him. He begins to slice and separate the organs from one another with a wicked looking dagger. Dark blue blood stains his robe as he probes the strange flesh. Finally after several minutes he smiles and pulls a parchment from a bag at his side and begins to draw several runes using the dark blue blood.");
    quest::say("Take this, I have discovered the secret of their magic, or so I believe. Of course it might not work and you'll end up actually dead, but we'll never know till you try, will we?");
    if($class eq "Necromancer") {
      quest::summonitem(59019); # Item: Spell: Auspice
    }
    elsif ($class eq "Shadowknight") {
      quest::summonitem(59006); # Item: Spell: Blood of Pain
    }
    else {
      quest::summonitem(quest::ChooseRandom(59019,59006)); # Item(s): Spell: Auspice (59019), Spell: Blood of Pain (59006)
    } 
    quest::me("As you take the scroll from him you notice a sickly burning odor in the air. You glance down at Cedric's robes and notice several holes beginning to form where the blood touches his [robes].");
    quest::exp(300);
  }
  elsif(plugin::check_handin(\%itemcount, 59050 => 1, 59036 => 1, 59051 => 1) && (defined($qglobals{luggald}) && ($qglobals{luggald} == 1))) { #Luggald bile, Luggald Blood, Luggald saliva
    quest::emote("takes the vials and holds them out in front of him. He begins to recite an incantation and the vials rise and float in the air in front of him. He continues to chant as each of the vials begins to glow and then grow dim in turn. Cedric picks up a large potion bottle and places a rolled piece of parchment inside. He then holds it before him causing it to float in the air as well. Each of the first three vials floats over the potion bottle and a distinct amount of each liquid is poured in, causing it to bubble and shake. Cedric reaches out before him and takes the bottle from the air and hands it to you.");
    quest::say("Fear is a weapon to be used against your enemies, $name, but we can not afford to let it cloud our judgment as well. Drink the potion and new power will energize your being.");
    quest::summonitem(59037); #Glowing dark blue potion
    quest::delglobal("luggald");
  }
  plugin::return_items(\%itemcount);
}