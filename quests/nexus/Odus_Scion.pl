sub EVENT_SAY { 
if ($text=~/Hail/i){
quest::say("Greetings $name . I am Kendal Groetan. I am here to assist and watch over those who wish to return to the continent of Odus. Due to the limited space I share this area with the portal to Velious. The [teleport system] back to Norrath is completely automated. I have no direct control over when the portal will turn on, although I can say that the system works on a schedule of approximately ten minutes."); 
}
if ($text=~/teleport system/i){
quest::say("The teleport system is pretty simple from your perspective. Simply listen for the voice saying that the portals will become active soon. When the time nears, you should stand on the elevated pad you see next to me. Shortly after you see the message that the teleporters are active, you will be transported to your destination..");
 }
}
#END of FILE Zone:nexus  ID:152003 -- Odus_Scion 

