sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to the Nexus! Down each stairway is a passage that leads out from the Nexus. Through those passages you will find the great trade city of Shadow Haven, the Bazaar, and the cavern systems that lead to the surface of Luclin. Also, located in each tunnel is a teleport pad that can return you to Norrath. There is much information to be gathered here. Be sure to speak to everyone and ask lots of questions. Farewell, $name.");
  }
# Expansion: Empires of Kunark
#  if ($text=~/hail/i) {
#    quest::say("Welcome to the Nexus! Down each stairway is a passage that leads out from the Nexus. Through those passages you will find the great trade city of Shadow Haven, the Bazaar, and the cavern systems that lead to the surface of Luclin. Also, located in each tunnel is a teleport pad that has the [power] to return you to Norrath. There is much information to be gathered here, be sure to speak to everyone and ask lots of questions. Farewell, $name.");
#  }
#  elsif ($text=~/power/i) {
#    quest::say("We, of course, have tapped into the power of transportation, as I'm sure you realize. With the restoration of our great Emperor... I mean Lord Katta, we have been asked to help those that wish to visit his new seat of power. If you wish to go there, this very spire will take you. All you need is a [Spire Stone of Lceanium] and you will be safely transported to the city. We have set up this great spire to transport anyone holding such a stone every few minutes, as the cycle of power peaks.  It is no minor magical feat to send a large group of creatures safely from Luclin to Kunark!  But feel assured that we can do so, and we almost never lose any transportees.");
#  }
#  elsif ($text=~/spire stone of lceanium/i) {
#    quest::say("Here is your Spire Stone. Remember, if you are holding that stone and remain in the area of the spire, you will be transported. The stone is fragile and will be consumed if you travel by the spire or just about any other means. Not to worry. We can provide you another if needed.");
#    quest::summonitem(18393); # Item: Spire Stone of Lceanium
#  }
}
#END of FILE Zone:nexus  ID:152013 -- Fani_Dertrimas
