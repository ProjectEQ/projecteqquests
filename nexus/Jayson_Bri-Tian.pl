sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Ahh, welcome, $name. It is good to see more and more people visiting now that the portals are functional. It took us many, many years to understand the magical powers of Luclin. Whether through dumb luck or divine intervention, we have succeeded in opening the gate back to Norrath.  How long it will stay open, no one knows. My colleagues and I are here to maintain and watch for changes in the Nexus. Should anything happen, you will be notified. Safe travels.");
  }
# Expansion: Empires of Kunark
#  if ($text=~/hail/i) {
#    quest::say("Ahh, welcome, $name. It is good to see more and more people visiting now that the portals are functional. It took us many, many years to understand the magical powers of Luclin. Whether through dumb luck or divine intervention, we have succeeded in opening the gate back to Norrath.  How long it will stay open, no one knows. I hope you know the importance of the stone that lies beneath our feet and the power that the Combine have been able to harvest from it. Even if you do not, we are willing to allow you to use that [power]. My colleagues and I are here to maintain and watch for changes in the Nexus. Should anything happen, you will be notified. Safe travels.");
#  }
#  elsif ($text=~/power/i) {
#    quest::say("We, of course, have tapped into the power of transportation, as I'm sure you realize. With the restoration of our great Emperor... I mean Lord Katta, we have been asked to help those that wish to visit his new seat of power. If you wish to go there, this very spire will take you. All you need is a [Spire Stone of Lceanium] and you will be safely transported to the city. We have set up this great spire to transport anyone holding such a stone every few minutes, as the cycle of power peaks.  It is no minor magical feat to send a large group of creatures safely from Luclin to Kunark!  But feel assured that we can do so, and we almost never lose any transportees.");
#  }
#  elsif ($text=~/spire stone of lceanium/i) {
#    quest::say("Here is your Spire Stone. Remember, if you are holding that stone and remain in the area of the spire, you will be transported. The stone is fragile and will be consumed if you travel by the spire or just about any other means. Not to worry. We can provide you another if needed.");
#    quest::summonitem(18393); # Item: Spire Stone of Lceanium
#  }
}
#END of FILE Zone:nexus  ID:152015 -- Jayson_Bri`Tian
