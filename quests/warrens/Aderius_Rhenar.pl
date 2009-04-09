sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name. I am Aderius Rhenar. priest of Quellious and assistant to Lady Laraena. I have been fortunate to be imprisoned here with these Kejekan cat men. they are a very wise people. Are you planning on returning to Erudin soon my friend?");
}
if($text=~/I am planning to return to erudin/i){
quest::say("I have managed to prepare a message on this scrap of cloth for the priestess Laraena. It is a matter of great importance to the High Council of Erudin. Please deliver this message to her promptly. I must stay here for a while longer and converse further with my Kejekan friends.");
quest::summonitem("2049"); }
}
#END of FILE Zone:warrens  ID:101087 -- Aderius_Rhenar 

