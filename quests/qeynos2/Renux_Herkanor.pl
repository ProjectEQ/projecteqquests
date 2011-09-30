sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 3) {
    quest::say("When is Lomarc getting back from Odus? He was supposed to be back three nights ago. Have you heard anything?");
	quest::signalwith(2074,3,1)
  }
  if($wp == 4) {
    quest::say("Hanns, you are not going to want to hear this, but one of our boys in Donovan's gang swears he saw Stanos in the Karanas a week ago. And we still haven't cornered Malka Rale.");
	quest::signalwith(2074, 4, 1);
	
  }
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("Ok, I'll send someone out to meet [Lomarc] behind the [Mermaid's Lure] tonight.");
  }
  if($signal == 2) {
	quest::say("Very well, Father is as good as dead. Did I ever mention that I really hate family reunions? <chuckle>. I am gone!");
	}
  }



sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You need something. or are you just browsing?"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2020 -- Renux_Herkanor 
