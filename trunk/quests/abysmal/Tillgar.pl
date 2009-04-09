# Freeport Stout for Tillgar
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Sorry if'n I seem a bit cranky today. Bein' 'ere without me [favorite drink] is causin' me a bit o' trouble."); 
}

if($text=~/what favorite drink/i){

quest::say("Why Freeport Stout of course! I don't be knowin' why I like it so much. Just do. There be none in this city though. If you could bring me four Freeport Stouts, I think I could part with some coin for ye."); 
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 13943 => 4)) { # Freeport Stout
quest::say("Blessed be ye! Tillgar immediately starts to swig down the stout. Take this for yer trouble. I don't much care fer wine.");quest::exp(1000);
quest::summonitem(55579); #  Cristov's Red Wine
quest::setglobal("chrisredwinea",1,5,"F");
quest::givecash(0,0,1,0);
}

}

#END of FILE zone:abysmal ID:279260 --  Tillgar.pl
