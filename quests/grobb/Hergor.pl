sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Whats you wants!!  Me great master of da bashers.  Me tinks yooz must be lookin' fer trainin'.  Yooz looks like a weaklin'.  Me train yooz and yooz helps me get fatter.  Well!!  Are yooz gonna [helps Hergor get fatter]?!!");
}
if($text=~/i want to help hergor get fatter/i){
quest::say("Yooz makes da good choice.  Me nevers get enuff ta eats.  Eats more and gets more stronger. me always say.  Yooz gos and speaks wit carver Cagrek.  Yooz tell him [Hergor wants his fungus dung pie].  Yooz duz dis and me gives you sum rawhide armer or tatters armer."); }
}

sub EVENT_ITEM {
plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
plugin::return_items(\%itemcount);
 }
#END of FILE Zone:grobb  ID:2548 -- Hergor 

