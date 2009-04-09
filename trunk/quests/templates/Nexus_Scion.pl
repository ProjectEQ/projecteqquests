sub EVENT_SAY { 
if ($text=~/Hail/i){
quest::say("Hello $name. I do not have much time to chat. I must concentrate on the portal that is due to open soon. If you wish to [journey to Luclin], tell me so."); 
}
if ($text=~/journey to Luclin/i){
quest::say("Take this, $name.  You must stay  inside the circle of the Spires, and keep this shard on your person.  Should you need another, simply ask me.  I do not think we will run out of shards any time soon!  If you do NOT wish to travel to Luclin, destroy that which I gave you, or step well away from the Spires lest you be caught up in the portal. It will open soon.");
quest::summonitem(19720);  
}
 }
