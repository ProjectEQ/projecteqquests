sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. The passages extending from the heart of Luclin take you east to Shadow Haven, south to the Bazaar, west in the direction of the city Sanctus Seru, and north to the city of Shar Vahl. Before heading in any one of these directions, speak to the keepers at the entrances.");
  }
}
# Expansion: Empires of Kunark
#  if ($text=~/hail/i) {
#    quest::say("Greetings, $name. The passages extending from the heart of Luclin take you east to Shadow Haven, south to the Bazaar, west in the direction of the city Sanctus Seru, and north to the city of Shar Vahl.  Before heading in any one of these directions, speak to the keepers at the entrances. Keep in mind that there is a lot of [power] in this place, so be safe.");
#  }
#  elsif ($text=~/power/i) {
#    quest::say("We, of course, have tapped into the power of transportation, as I'm sure you realize. With the restoration of our great Emperor... I mean Lord Katta, we have been asked to help those that wish to visit his new seat of power. If you wish to go there, this very spire will take you. All you need is a [Spire Stone of Lceanium] and you will be safely transported to the city. We have set up this great spire to transport anyone holding such a stone every few minutes, as the cycle of power peaks.  It is no minor magical feat to send a large group of creatures safely from Luclin to Kunark!  But feel assured that we can do so, and we almost never lose any transportees.");
#  }
#  elsif ($text=~/spire stone of lceanium/i) {
#    quest::say("Here is your Spire Stone. Remember, if you are holding that stone and remain in the area of the spire, you will be transported. The stone is fragile and will be consumed if you travel by the spire or just about any other means. Not to worry. We can provide you another if needed.");
#    quest::summonitem(18393); # Item: Spire Stone of Lceanium
#  }
#END of FILE Zone:nexus  ID:152014 -- Kardador_Tarsinian
