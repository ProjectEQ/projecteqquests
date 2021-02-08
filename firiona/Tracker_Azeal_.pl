#Tracker Azeal is actually Hero Goxnok in disguise. This version of him has been triggered to spawn at 9 PM game time, and will then path out of the outpost. After a time, he will pause on his normal pathing and kneel and we can give him an item to spawn Hero Goxnok. All of this is for the fifth Greenmist quest.
# items: 12691

sub EVENT_SPAWN {
 quest::say("I'm going to start my patrol. I'll report back by morning.");
 quest::settimer("Patrol",10);
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12691 => 1)) { #Test of Betrayal (Greenmist Quest 5/8)
    quest::emote("begins to pull his face off.. it is a disguise!! 'Aha!! You have made it!! I cannot see well in this disguise, but I thought I smelled you. I have [news of the Charasis tome].'");
    quest::ding();
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(84319,0,0,$x,$y,$z,$h); # NPC: Hero_Goxnok
    quest::spawn2(84311,0,0,-1822,617,142.5,206); # NPC: a_drachnid_spy
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  if ($timer eq "Patrol") {
    quest::start(11);
    quest::stoptimer("Patrol");
    quest::settimer("ZoneTime",60);
  }
  if (($timer eq "ZoneTime") && ($zonehour == 6)) {
    quest::spawn2(84277,0,0,2268,-2828,-74.8,475); # NPC: Tracker_Azeal
    quest::stoptimer("ZoneTime");
    quest::depop();
  }
}
#Submitted by Jim Mills
