sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings $name. I am Horender Tevalian. I was one of the first to travel to Luclin when the secrets of the teleports were unlocked. Once here, the Midst Collective asked that I maintain vigil over the portal back to the Karanas. The [teleport system] back to Norrath is completely automated. I have no direct control over when the portal will turn on, although I can say that the system works on a schedule of approximately ten minutes."); 
  }
  if ($text=~/teleport system/i) {
    quest::say("The teleport system is pretty simple from your perspective. Simply listen for the voice saying that the portals will become active soon. When the time nears, you should stand on the elevated pad you see next to me. Shortly after you see the message that the teleporters are active, you will be transported to your destination..");
  }
}
#END of FILE Zone:nexus  ID:152005 -- Antonica_Scion