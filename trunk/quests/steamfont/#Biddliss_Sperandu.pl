#BeginFile: steamfont\#Biddliss_Sperandu.pl
#Quest file for Steamfont Mountains - Biddliss Sperandu: Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Go away before I sic the clockworks on ya!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 9831 => 1)) { #Note to Biddliss
    quest::say("Kazen wants some research tools? That is fine. I want something from you first, however. Bring me four gleaming zraxthil ores and combine them in this satchel. Why do I want them? Why do you care? Bring them to me or you don't get your tools. Now scram!");
    quest::summonitem(9579); #Gleaming Ore Satchel
  }
  elsif(plugin::check_handin(\%itemcount, 27982 => 1)) { #Sealed Ore Satchel
    quest::say("So you're not totally useless after all. Maybe there is a reason Kazen hasn't destroyed you yet. Take these tools and give my warmest regards to Master Kazen.");
    quest::summonitem(21799); #Biddliss's Research Tools
    quest::depop();
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

#EndFile: steamfont\#Biddliss_Sperandu.pl (00000)
