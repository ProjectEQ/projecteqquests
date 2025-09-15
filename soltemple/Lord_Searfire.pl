##################################################################
#  NPC:  Lord Searfire
#  Quest:  Paladin Ro Armor
#  Zone:  Temple of Sol Ro
##################################################################
# items: 17977
sub EVENT_SAY { 
   if ($text=~/hail/i) {
      quest::say("Greetings! May the glory of Solusek Ro burn in your veins. I am the forge master of this temple. Called to service by the Burning Prince. Should you ever need my service and find me gone. have no fear. I shall return. I must occasionally venture to other realms in service of the temple. I shall always return. This is my eternal home."); 
   }
   elsif ($text=~/ronium/i) {
      quest::say("You seek ronium. It is a fine blend of metals. I alone hold the secret of its formula. I, and I alone, can offer it to those who serve this temple. Do you wish a [bar of the alloy]?");
   }
   elsif ($text=~/bar of the alloy/i) {
      if ($faction < 5) { # Amiable
         quest::say("Take this Sol Cauldron.  Within it shall be combined elements of this world. You will add to it, melatite, two bars of enchanted platinum, Mistmoore granite, the sands of Ro and soil of Underfoot. If you be a master blacksmith, the elements shall combine to make the enchanted metal I have named 'ronium.'");
         quest::summonitem(17977); # Item: Sol Cauldron
      } else {
         quest::say("There is much service to Ro which you must perform. I cannot trust you until you have proven your worth to us. Seek service within this temple or join the crusade within the desert of Ro.");
      }
   }
}
#END of FILE Zone:soltemple  ID:3316 -- Lord_Searfire