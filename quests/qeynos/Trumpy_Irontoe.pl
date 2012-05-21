sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 2) {
    quest::say("Time to drain the [dragon].. if ya know what I mean.. Bwah ha ha ha.");
    quest::signalwith(1074,1,1)
  }
  if($wp == 4) {
    quest::say("Outta my way, ya big lummox!");
    quest::signal(1075, 1);
  }
    if($wp == 7) {
    quest::say("<BURP!> Heh heh.. Enjoy that one, boys!");
    quest::signalwith(1090,3,1);
  }
  if($wp == 11) {
    plugin::DoAnim("kick");
  }
  if($wp == 12) {
    quest::say("Hey, Fishboy! You dropped something! Bwah ha ha ha!");
    quest::signalwith(1159,2,1);
  }
  if($wp == 17) {
    quest::say("Heh. What a loser!");
    quest::signalwith(1090,4,1);
  }
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("You know you love me.");
  }
  if($signal == 2) {
    quest::say("Better start learning, [Skippy].");
    quest::signalwith(1159,3,1);
  }
  if($signal == 3) {
    quest::say("Peh! What have you been eating? Your brother's bait? You are lucky I don't have time to give you the beating you so richly deserve.");
  }
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    my $random = int(rand(5));
    if($random == 0) {
      quest::say("Heh? What's yer name? $name? Never heard of ya. Now quit breathin' on me and buy us some [drinks]!");
    }
    if($random == 1) {
      quest::say("Outta my way, ya big lummox!");
    }
    if($random == 2) {
      quest::say("Time to drain the [dragon].. If ya know what I mean.. Bwah ha ha ha.");
    }
    if($random == 3) {
      quest::say("You know you love me.");
    }
    if($random == 4) {
      quest::say("Hey Fishboy! You dropped something! Bwah ha ha ha! Better start learning [Skippy].");
    }
  }
  if($text=~/drinks/i) {
    quest::say("<BURP!> Yeah. Gimme a.. <BURP!> er.. honey mead.");
  }
  if($text=~/skippy/i) {
    quest::say("Skippy? You mean that fish farmer? Heh heh heh. What a moron. And his brother [Beren] has the nerve to actually threaten ME!?.. Burp.. Bah. Remind me to tell [Kane] about that steaming pile of gnoll dung.");
  }
  if($text=~/beren/i) {
    quest::say("Don't even mention that weakling's name. He.. burp.. Keeps threatening me. ME! Trumpy IRONTOE!!! Peh! That useless son of a goblin had better wise up and realize that in this burg if you ain't with [Kane], you are against him. And if you are against him.. burp.. you ain't nothing but a corpse.");
  }
  if($text=~/kane/i) {
    quest::say("Ah.. burp.. that piece of cr.. eh? Oh its you.. Kane runs this burg.. or at least he will.. if [Sragg] can get his act together.");
  }
  if($text=~/sragg/i) {
    quest::say("Where did you hear that name?!? Not from me! I didn't say nothing about Sragg or those Bloodsabers or their dang temple in the sewers! Get away from me ya hobgoblins! I don't wants no trouble!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13033 => 4)) {
    quest::say("Beh! Thanks, Skippy. Why don't ya buy yourself one? And.. <GULP>.. <BURP!>.. get me another!");
    quest::faction(33,1);
    quest::faction(217,-1);
    quest::faction(53,1);
    quest::faction(135,-1);
    quest::faction(164,1);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:qeynos  ID:1014 -- Trumpy_Irontoe