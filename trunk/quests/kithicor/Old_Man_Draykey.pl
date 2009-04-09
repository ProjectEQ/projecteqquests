sub EVENT_SPAWN {
	quest::settimer(2,120);	  # 2 min between shouts
}

sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say("Greetings $name! Have you [come to participate] in the festivities?");
	}

	if ($qglobals{draykey} != 1 && $text=~/come to participate/i) {
		quest::say("Excellent, excellent! For those of you that enjoy trick-or-treating I have set up an event beyond anything you have done before. I will have convinced ten...well beings...not all of them are really people, to help with this. It's a very tricky endeavor, with highly complex [instructions]. Prepare yourself and then I will reveal the secrets to you.");
	}

	if ($qglobals{draykey} != 1 && $text=~/instructions/i) {
		quest::say("First of all you need to know how to properly speak with these people. Once you find them, you simply need to say 'Trick or treat', and see what they have to say in return. I have compiled a list of my helpers around Norrath and have written them down in my book. As I have said, there are ten people each with a piece of candy you'll need to collect. Once you've collected all ten return to me with the full bag.");
		$client->Message(0,"Oh, and here, take these rations. I wouldn't want you eating the candy before you can bring it back to me!");
		quest::summonitem(13005,20); # Stack of iron rations
		quest::summonitem(13005,20); # another stack of iron rations
		quest::summonitem(84095);    # the bag
		quest::summonitem(84094);    # the hints
                quest::setglobal("draykey",1,0,"D30");
	} 
        elsif ($qglobals{draykey} == 1){
                quest::say("I'm sorry, but you can only complete my event once!"); }
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 84096 => 1)) {
		quest::say("Ah ha! You've found them all! Excellent work, here's a bit of candy for you. Enjoy!");
		$client->Message(3,"Happy Halloween!");
		quest::summonitem(85062);
		quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),20);
	} else { plugin::return_items(\%itemcount); }
}
		
sub EVENT_TIMER {

	if ($timer == 2) {
		quest::stoptimer(2);
		quest::settimer(2,120);
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}