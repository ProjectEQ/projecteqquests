sub EVENT_SAY {

if($text=~/Hail/i && $pov_key_quest == undef) {

	quest::say("You're either [brave], or you're [stupid]");

	}

if($text=~/brave/i && $pov_key_quest == undef) {

	quest::say("That you are.  Perhaps you'd be interested in helping our [company]");

	}

if($text=~/company/i && $pov_key_quest == undef) {

	quest::say("We're a part of the Battalion of Marr. We're soldiers from Che Virtuson. We were dispatched to this part of the Plane of Valor to eliminate an age old target. Unfortunately, due to some recent events our mission has been placed on hold and our [squad] has been asked to remain behind.");

	}

if($text=~/squad/i && $pov_key_quest == undef) {

	quest::say("We are a part of Ducee Tapferson. Our squad is known for our bravery. We were successful in capturing this [razorfiend] earlier today. You've shown some bravery as well my friend and that is the reason I request your [assistance].");

	}


if($text=~/razorfiend/i && $pov_key_quest == undef) {

	quest::say("These vile beasts live in the caves west of here.");
	
	}	

if($text=~/assistance/i && $pov_key_quest == undef) {

	quest::say("Man of us here are anxious to leave.  May wish to regroup with the rest of our company.  Others wish to go back to the Halls to complete the [Trials]");

	}

if($text=~/trials/i && $pov_key_quest == undef) {

	quest::say("The Trials are overseen by the Heroes of Marr. It's these Trials that allow us to rise in rank. Only those who have passed the trials are able to enter the Temple of Marr. Now if you wish to aid us I must ask you to do a few [things].");

	}

if($text=~/things/i && $pov_key_quest == undef) {

	quest::say("You must find the Master Sergeant and tell him that you are here to [aid the cause].");
	quest::setglobal("pov_key_quest", 1, 5, "F");
	}


if($text=~/hail/i && $pov_key_quest == 2) {

	quest::say("Im sorry the Master Sergeant was unable to help you. Perhaps you should [prove] yourself before you attempt to jump 'into the fire' so to speak.");
	
	}

if($text=~/prove/i && $pov_key_quest == 2) {

	quest::say("We've been running into a lot of problems lately with the razorfiends and the planarian larvae. Many soldiers have been getting sick because of the infestations that they cause. Capture the hearts of a razorfiend, a crystalline spider and a planarian larvae and bring them back to me. Our squad had enough problems capturing this small razorfiend here. This will become your first so called 'Trial' $name. It should be enough to prove your worth.");

	}


if($text=~/hail/i && $pov_key_quest == 5) {

quest::say("Good Luck");

}



	{
	$pov_key_quest=undef;
	}


#############################################

}

sub EVENT_ITEM {

	if(plugin::check_handin(\%itemcount, 25598 => 1, 25597 => 1, 25599 => 1)) {

	quest::say("Very good my friend. You've definitely proven yourself. Find the Master Sergeant. He should be able to help you this time.");
	quest::setglobal("pov_key_quest", 3, 5, "F");
	}

else {
    plugin::return_items(\%itemcount);
  }  



	{
	$pov_key_quest=undef;
	}

}
