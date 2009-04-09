sub EVENT_ITEM{
if(plugin::check_handin(\%itemcount,20696=>1))
{
quest::say("What's this? Egads! It's perfect.  Now all we gotta do is hope he bites.' Dolgin takes a little of the essence and smears it on a piece of bread. He places the bait into the water and watches intently.");
quest::summonitem("20696");
quest::spawn2(96073,0,0,-2178,-11745,-0.63,63);
quest::depop(); 
}
plugin::return_items(\%itemcount); # return unused items
}
#END of FILE Zone:timorous  ID:Not_Found -- Dolgin_Codslayer 
