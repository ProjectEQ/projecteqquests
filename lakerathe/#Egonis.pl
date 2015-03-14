#BeginFile: lakerathe\#Egonis.pl
#Quest file for Lake Rathetear - Egonis: Necromancer Epic 1.5 (pre)

sub EVENT_SAY {
  if($text=~/hail/i) {
    if(defined($qglobals{NecroPre}) && ($qglobals{NecroPre} == 1) && !plugin::check_hasitem($client, 20612)) { #Piece of the Staff (Allow continue in case of zone fail, etc.)
      quest::say("So the foolish brigand sold the staff to Ronaiar, eh? Who is Ronaiar? He is an insane necromancer that makes his home somewhere near the lake. I had a feeling he would try to get his hands on the staff. That is why I came out here. I must inform Kazen of this turn of events and you must destroy that decrepit fool, Ronaiar. If you find the staff, give it to Geboron.");
      quest::unique_spawn(51155,0,0,1010,2690,-23,0); #Ronaiar Skullmoore
    }
    else {
      quest::say("The lake's depths hold so many secrets. Unless you have a reason to be bothering me, I would suggest you leave, before you become another 'secret'.");
    }
  }
}

sub EVENT_ITEM {
  if(($class eq "Necromancer") && plugin::check_handin(\%itemcount, 15523 => 1)) { #Contract of Sale
    quest::say("So the foolish brigand sold the staff to Ronaiar, eh? Who is Ronaiar? He is an insane necromancer that makes his home somewhere near the lake. I had a feeling he would try to get his hands on the staff. That is why I came out here. I must inform Kazen of this turn of events and you must destroy that decrepit fool, Ronaiar. If you find the staff, give it to Geboron.");
    quest::setglobal("NecroPre",1,5,"F");
    quest::unique_spawn(51155,0,0,1010,2690,-23,0); #Ronaiar Skullmoore
  }
  plugin::return_items(\%itemcount);
}
#EndFile: lakerathe\#Egonis.pl (51175)