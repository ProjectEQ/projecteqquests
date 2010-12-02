sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Ah. good day to thee. $name and welcome to New Tanaan. If you are searching for knowledge and a quiet. peaceful place to calm your senses from the wears of battle. then you could not have made a finer choice than the Plane of Knowledge. The residents of New Tanaan have come together with the recent presence of your kind in hopes of aiding and guiding you where and when we can. If you are perhaps of the bardic ilk. then I might be of some assistance. Please. search my stock if you wish it. All of the songs are recently penned by my own hand. though they are not of a unique or rare breed. they will serve any bard of the proper experience.");
 }
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:poknowledge  ID:202230 -- Minstrel_Silnon 

