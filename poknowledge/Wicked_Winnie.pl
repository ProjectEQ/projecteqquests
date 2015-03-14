sub EVENT_SAY {
  	if(!quest::istaskactive(214)){
		if(!defined $qglobals{halloween_winnie}){
  			if($text=~/hail/i) {
      				quest::say("Salutations, are you enjoying the [festivities]? I know I am.");
      			}
  			if($text=~/festivities/i) {
      				quest::say("This is my favorite time of year! Little hobgoblins running around, candy, and spooky hauntings. If I had some of my [Wicked Liquid Caramel] I could really dress up some apples. Divine!");
      			}
 			if($text=~/Wicked liquid caramel/i) {
				quest::say("Oh yes. Haunted Jack has some Haunted Candy Apples he is carting around, but those are nothing compared to my concoctions. Unfortunately, the caramel I use is very special and I've been so busy helping Sally out with her costumes this year that I haven't had time to [track it down].");
			}
  			if($text=~/track it down/i) {
				quest::say("Well, last time I ran across it through a gnome named Finkel. It's possible that he still has some. I believe he is doing business in Steamfont this time of year.");
                                quest::assigntask(219);
				quest::assigntask(214);
			}
		}
		else {
			quest::say("Enjoy your apples!");
		}		
	}	
}

sub EVENT_ITEM {
	if(quest::istaskactive(214)){
		if(plugin::check_handin(\%itemcount, 54723 => 1)) {
			quest::emote("whips up a batch of her famous Caramel-Coated Candy Apples! ");
			quest::summonitem(85064,5);
			$client->AddLevelBasedExp(10, 0);
			quest::setglobal("halloween_winnie",1,0,"H3");
			quest::updatetaskactivity(214,0);
		}
	}
  plugin::return_items(\%itemcount);
}
