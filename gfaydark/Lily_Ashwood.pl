sub EVENT_SAY {
if ($text=~/hail/i) {
  quest::say("Hello there, $name. You wouldn't by chance happen to be a ranger, would you?'");
} 
if($text=~/i am a ranger/i){
quest::say("I sure love a strong ranger. Especially Ganelorn Oast. He's so dreamy and handsome. I think one day he's going to ask me to marry him."); }
}
#END of FILE Zone:gfaydark  ID:54082 -- Lily_Ashwood 

