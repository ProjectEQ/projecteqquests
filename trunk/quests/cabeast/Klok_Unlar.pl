sub EVENT_SAY { 
if($text=~/what bixie berry pie?/i){
quest::say("Bixie berry pie?!!  It is no treat and is poisonous to the Iksar.  We use it to keep our froglok slaves nourished.  My apprentice baker. Bugrin. bakes them and delivers them to the slaves.  Only he has access to the bixie berry pie recipe.  All the pies are eaten by the slaves. If you think you have one. you must be mistaken.  Let me see it if you believe you have one.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12676 =>1 )) {
    quest::emote("breaks open the crust of the pie.");
    quest::say("Wait! What is this? A device of some kind? It looks kind of like some sort of lockpick. BUGRIN!! Get in here and answer some questions at once!!");
    quest::spawn(106302,0,0,120,563,4);  
    
  }
}
#END of FILE Zone:cabeast  ID:3051 -- Klok_Unlar 

