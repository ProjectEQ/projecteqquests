# snow griffin souffle portion of the 3rd coldain prayer shawl
# part of seventh coldain prayer shawl
#
# since there is no viable way for an untargetted npc to respond to a phrase
# (prayer to brell) said by the player the quest needs to be changed slightly.
# the player will recite the prayer to the grand historian a certain number
# of times to receive the etched rune pattern.

my $counter;
my $count = 0;

sub EVENT_SPAWN {
  $counter = 0;
  quest::settimer("lecture",110);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::signalwith(115015,99,0);
  }
  elsif ($text=~/Oh Brell, Thank you for protecting me and seeing me through my trials. Forgive me for the things I think and say and do that displease you. Please reveal to me your will and bless me with the patience and obedience to do that which you desire. Amen./i) {
    $counter += 1;
    if ($counter == 1) {
      quest::signalwith(115230,33,0);
    }
    elsif ($counter == 2) {
      quest::signalwith(115230,66,0);
    }
    elsif ($counter == 3) {
      quest::signalwith(115230,99,0);
      quest::summonitem(1855);
      $counter = 0;
    }
  }
}

sub EVENT_TIMER {
	$count++;
	if($count==1) {
		quest::say("We are taught from day one that the truth lies underfoot. It is simple common sense then, that the taller a being is, the farther his mind and heart are from the truth. Always be wary of those larger in stature than us.");
		quest::signal(115028,8000);
		quest::signal(115197,8000);
		quest::signal(115025,16000);
		quest::signal(115194,16000);
	}
	if($count==2) {
		quest::say("If we Coldain just work together, obeying Brell's teachings, nothing can stop us from overcoming our enemies. Even the Kromrif will fall before us if we are undivided. It is only when we stray from our fundamental knowledge that we are vulnerable.");
	}
	if($count==3) {
		quest::say("Allow me to share a short story from my youth. It begins when I was just tail high to a snow bunny. Instead of tending to my studies, I snuck out and participated in what was then our 300th annual snowball fighting tournament. . .");
		quest::settimer("lecture",70);
	}
	if($count==4) {
		quest::settimer("lecture",25);
		quest::signalwith(115022,1);
		quest::signalwith(115191,1);
		quest::signal(115021,8000);
		quest::signalwith(115022,2,8100);
		quest::signalwith(115191,2,8100);
	}
	if($count==5) {
		quest::say("Young Doriggan, perhaps you will find it easier to focus on my words from a standing position. That corner will do fine.");
		quest::signalwith(115022,3);
		quest::signalwith(115191,3);
		quest::settimer("lecture",110);
	}
	if($count==6) {
		quest::say("I have an important announcement to make today. The Dain has heard rumor of a faction of our brethren who openly oppose the crown. If you come forth with any information leading to the discovery of any such traitorous vermin you will be richly rewarded. Their fate most certainly lies at the bottom of the well.");
		$count = 0;
	}
}
		
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1418 => 1, 1428 => 1)) {
    quest::say("My compliments, $name, what a wonderful dish! Please accept my personal Seal as a token of my appreciation. May it give you power over your adversaries.");
    quest::summonitem(1422);
    quest::exp(200000);
    quest::faction(49,10); #coldain
    quest::faction(67,10); #dain
    quest::faction(188,-30); #krif
    quest::faction(189,-30); #kzek
  }
  elsif (plugin::check_handin(\%itemcount, 1428 => 1)) {
    quest::say("My compliments, $name, what a wonderful dish!");
    quest::exp(5000);
    quest::faction(49,10); #coldain
    quest::faction(67,10); #dain
    quest::faction(188,-30); #krif
    quest::faction(189,-30); #kzek
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: thurgadina ID: 115135 NPC: Grand_Historian_Thoridain