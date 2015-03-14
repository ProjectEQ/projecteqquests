sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name.  I'm Gretta Mottle.  Tumpy has been kind enough to let me to set up my bakery in his fine establishment here.  Unfortunately. with that nasty plague corruptin' the crops in the Plains of Karana. things are goin' a bit slow for me.  I keep runnin' out of bread and muffins to sell.  Because of flour bein' easily spoiled now. it takes longer to make 'em just right.  My assistant Buggle is still learnin' how to cook.  Hehe.. All he can make is Meat Pie.  If I don't get any [help to bake] soon I won't be able to keep the supply up with the demand.");
}
if($text=~/what help to bake/i){
quest::say("Glad to hear it.  Are ye thinkin' of helpin' me to [bake muffins] or did ye want to [fetch some bread] for me?");
}
if($text=~/what bake muffins/i){
quest::say("Ah. if ye want to help me with the bakin");
}
if($text=~/what fetch some bread/i){
quest::say("The only one who can make bread almost as good as I can is Jarlen Meadowgreen.  He lives a long way off though.. in the southern Plains of Karana.  If ye travel there. tell him that you are there to pick up some bread loaves for me."); }
}
#END of FILE Zone:kaladima  ID:60000 -- Gretta_Mottle 

