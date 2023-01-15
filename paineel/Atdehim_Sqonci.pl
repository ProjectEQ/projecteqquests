# items: 13716, 16989, 1437, 7005, 1438
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Ah, greetings. I hope you are a student of the way of fear. Within this temple there are many who can teach you to harness your gifts. I am an instructor in the [rituals of fear].");
  }
  if($text=~/rituals of fear/i) {
    quest::say("So you wish to learn, eh? I am working on a ritual to strike fear into the hearts of the other inhabitants of Odus. The reagents I require for this ritual are the doll of a Kerran priestess, the ichor of a giant wooly spider, your initiate symbol of Cazic-Thule, and a giant snake fang with which to carve my glyphs. Fetch me these components. We shall infect this land with fear, and I shall reward you with the station of disciple of this temple.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13716 => 1, 16989 => 1, 1437 => 1, 7005 => 1)) { #Kerran Doll, Ichor, Initiate Symbol of Cazic Thule, Giant Snake Fang
    quest::say("Excellent work, $name. You are well on your way to proving yourself worthy to serve Cazic Thule.");
    quest::summonitem(1438); #Disciple Symbol of Cazic Thule
    quest::exp(2000);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:paineel  ID:75019 -- Atdehim_Sqonci