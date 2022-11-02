# items: 84095, 84094, 13005, 84096, 85062, 85064, 85068, 85065, 85063, 85066, 85067
sub EVENT_SPAWN {
	quest::settimer(2,600);
}

sub EVENT_SAY {
	if(!quest::istaskactive(500220)){
		if(!defined $qglobals{halloween_draykey}){
			if ($text=~/Hail/i) {
				quest::say("Greetings $name! Have you [come to participate] in the festivities?");
			}
			if ($text=~/come to participate/i) {
				quest::say("Excellent, excellent! For those of you that enjoy trick-or-treating I have set up an event beyond anything you have done before. I will have convinced ten...well beings...not all of them are really people, to help with this. It's a very tricky endeavor, with highly complex [instructions]. Prepare yourself and then I will reveal the secrets to you.");
			}
			if ($text=~/instructions/i) {
				quest::say("First of all you need to know how to properly speak with these people. Once you find them, you simply need to say 'Trick or treat', and see what they have to say in return. I have compiled a list of my helpers around Norrath and have written them down in my book. As I have said, there are ten people each with a piece of candy you'll need to collect. Once you've collected all ten return to me with the full bag.");
				quest::summonitem(84095);    # the bag
				quest::summonitem(84094);    # the hints
				quest::assigntask(500219);
      				quest::assigntask(500220);
				if(!defined $qglobals{halloween_draykey_rations}){
					$client->Message(0,"Oh, and here, take these rations. I wouldn't want you eating the candy before you can bring it back to me!");
					quest::summonitem(13005,20); # Stack of iron rations
					quest::summonitem(13005,20); # another stack of iron rations
					quest::setglobal("halloween_draykey_rations",1,0,"D30");
				}
			}
		}
        	else {
              	quest::say("I'm sorry, but you can only complete my event once!"); 
		}
	}
	elsif(quest::istaskactive(500220)){
		quest::say("Once you've collected all ten return to me with the full bag.");
	}
}

sub EVENT_ITEM {
	if(quest::istaskactivityactive(500220,11)){
		if(plugin::check_handin(\%itemcount, 84096 => 1)) {
			quest::say("Ah ha! You've found them all! Excellent work, here's a bit of candy for you. Enjoy!");
			$client->Message(3,"Happy Halloween!");
			quest::summonitem(85062); # Item: Bristlebane's Ticket of Admission
			quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),20); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
			quest::setglobal("halloween_draykey",1,0,"D30");
			quest::updatetaskactivity(500220,11);
		}
	}
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::stoptimer(2);
		quest::settimer(2,600);
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}
