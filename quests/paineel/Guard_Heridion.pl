sub EVENT_SAY {
if($text=~/Hail/i && $faction <= 5){
quest::say("Uggg. You needz [keyz]? Rrrrrrr.");
}
if($text=~/keyz/i && $faction <= 5){
quest::say("Uggggg. Take dis keyz.");
quest::summonitem("6378"); }
}


#END of FILE Zone:paineel  ID:75010 -- Guard_Heridion 

