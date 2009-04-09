#BeginFile: lakerathe\#Egonis.pl
#Quest file for Lake Rathetear - Egonis: Necromancer Epic 1.5 (pre)

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $name."); #Real text still needed
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 15523 => 1)) { #Contract of Sale
    quest::say("So the foolish brigand sold the staff to Ronaiar, eh? Who is Ronaiar? He is an insane necromancer that makes his home somewhere near the lake. I had a feeling he would try to get his hands on the staff. That is why I came out here. I must inform Kazen of this turn of events and you must destroy that decrepit fool, Ronaiar. If you find the staff, give it to Geboron.");
    quest::setglobal("NecroPre",1,0,"F");
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

#EndFile: lakerathe\#Egonis.pl (00000)