sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Ahoy there. [sailor]!"); }
}

sub EVENT_SIGNAL {
quest::say("Ha! The closest you will get to tonic is in the library. That's assuming you know how to spell tonic. Bwaha ha! When you see the bookworm give her a KISS for me! HAHA!!");
quest::signalwith(24067,51);
}
#END of FILE Zone:erudnext  ID:98037 -- Phloatin_Highbrow 

