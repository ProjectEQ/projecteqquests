sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there $name. Might you be interested in helping us make a [delivery].");
}
if($text=~/what delivery/i){
quest::say("We have a barrel of brew that we must deliver to Ryann Desgrey. We've been meaning to deliver it. but haven't been able to. because Caelin's been feeling ill. But before you can deliver it I have to know that you're able to make the trek across these lands. Bring me back a Fungus Mushroom.'"); }
}
#END of FILE Zone:dawnshroud  ID:174101 -- Anario_Dirkog 

