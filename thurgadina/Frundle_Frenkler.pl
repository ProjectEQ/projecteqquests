# Frundle Frenkler - vial of velium vapors
#
# items: 17513

sub EVENT_SAY {
  if ($text=~/velium vapors/i) {
    quest::say("Ahh, you come seeking my family recipe? After all you've done for our people it's the least I can do. First you must fashion a velium vial, then combine the vial with two small pieces of velium in this jar. That's all there is to it. Please keep the recipe a secret.");
    if(!plugin::check_hasitem($client,17513)) { #Velium Purifier
      quest::summonitem(17513); #Velium Purifier
    }
  }
  if ($text=~/velium vial/i) {
    quest::say("I'm no potter mind you, but if I remember correctly it's a small brick of velium, three crystalline silks, and two glass shards. Then you'll have to finish up by firing it in a kiln with a high quality firing sheet.");
    if(!plugin::check_hasitem($client,17513)) { #Velium Purifier
      quest::summonitem(17513); #Velium Purifier
    }
  }
}

# EOF zone: thurgadina ID: 115006 NPC: Frundle_Frenkler