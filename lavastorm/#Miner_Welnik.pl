#Welnik's Picks and Ore by druid64 02/02/2012 updated from original code by Swiftsong_Lorekeeper
#  #Miner_Welnik.pl goes in /quest/lavastorm/
# items: 54435, 71705, 7882, 71706

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Oh excuse my rudeness $name, but I'm afraid I don't have much time for idle chatter, I must find those [picks]!");
	}
	if($text=~/picks/i) {
		quest::say("The mining picks! Bibol had me gathering up all the ones that were no longer usable to take to the smith and they are just gone. If I don't get them back in time, he will have my head! I've already wasted far too much [digging] time looking for them.");
	}
	if($text=~/digging/i) {
		quest::say("Dig dig dig, that's what we do. I don't know what is so all-important, but the boss has been in no mood for tricks this time around. I must [find] those picks and dig another six feet!");
	}
	if($text=~/find/i) {
		quest::say("Yes find them, I must! Oh...Oh what are you doing? Do you think you could [help]? Can you find them for me?");
	}
	if($text=~/help/i) {
		quest::say("There are four that I am still missing. How does this sound, I will stay here and dig to keep them off my back, and you find the picks and take them to the smith? His name is Numden, has a little shop in Steamfont. I am sure that I could find a way to reward you");
	}
	if($text=~/extra/i) {
		quest::say("I am a bit of a jeweler on the side. I find it relaxing after working in the mines all day, and it comes in handy when I find the spare gem laying around. There is a special kind of fiery ore that can be found in these mountains. Bring me four pieces of it, and I shall make you a ring. How does that sound?");
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 54435 => 1)){ #bundle of shiny new picks x 1
		quest::say("Oh, these are perfect! Please accept this as a reward. Actually, since you have done so much for me, I might be able to give you something [extra]");
		quest::ding();
		quest::summonitem(71705); # Item: Intricate Tool Belt
		quest::exp(1000);
	}
	if (plugin::check_handin(\%itemcount, 7882 => 4)) { #fiery ore x 4
		quest::say("That's the stuff. Three for me, one for you! Here is your ring $name. Thank you again for your help!");
		quest::ding();
		quest::summonitem(71706); # Item: Glowing Magma Ring
		quest::exp(1000);
	} 
	plugin::returnUnusedItems();
}

sub EVENT_SPAWN {
	my $x;
	my $y;
	my $z;
	my $h;

	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	$h = $npc->GetHeading();

	quest::set_proximity( $x-40,$x+40,$y-40,$y+40,$z-40,$z+40);
} 

sub EVENT_ENTER {
	quest::say("Oh dear, oh dear. Where have they gone? My boss is going to kill me! ");
}