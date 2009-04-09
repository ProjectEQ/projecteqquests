sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Tabernacle of Terror. Perhaps you can control your fear long enough to be of [service] to us.");
}
if($text=~/what service/i){
quest::say("I need some things fetched from the creatures just outside our city for some ritual experimentation. Bring me two tufts of bat fur and two fire beetle legs and I will school you in the ways of terror."); }
}
#END of FILE Zone:paineel  ID:75018 -- Dzan_Amo 

