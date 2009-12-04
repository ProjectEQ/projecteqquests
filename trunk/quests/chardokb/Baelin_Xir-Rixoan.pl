#Baelin_Xir-Rixoan.pl
#Help Baelin

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::say("Pfft mortal what is it that you want? I have nothing to say to those unlike me, I wish to be left alone so please leave me be to my [fortress].");
	}
	
	if ($text=~/fortress/i) {
		quest::say("I do not know why I am tolerating your council but for some reason I feel you can be of some use to me besides having your skull as a paperweight. I have been trapped in this dwelling for ages and I seek someone that will help me be freed of this [mystical prison].");
	}
	
	if ($text=~/mystical prison/i) {
		quest::say("There are many unseen shackles that confine me to this room. They were first placed upon me years ago for my cannibalistic tendencies. You see I was the leader of one of the most powerful religious sects of the di`zok. I conducted many [ceremonies] in our place of worship and not many were in approval of the royal di`zok family.");
	}
	
	if ($text=~/ceremonies/i) {
		quest::say("Many of our sacrifices took place with our most unfortunate captives and there was never one that went before the knife that was a member of the brood but somehow it got out that we were sacrificing one of our own kind and for that I was sentenced to these halls never to be seen again. I do however think that you could help me [escape] if you chose to.");
	}
	
	if ($text=~/escape/i) {
		quest::say("I truly do not believe what I am hearing but for some reason I feel that I should trust you. I am going to ask you to return me four pieces of my staff that were lost after I departed the home of the di`zok. I lost many of them fighting to break free from the guards that were ordered to capture me. If you would [return these staff pieces] I can then reconstruct my staff and use it to counteract the barrier surrounding my quarters.");
	}
	
	if ($text=~/return these staff pieces/i) {
		quest::say("Very well $name, begin your search now and do not cease until you have found the four pieces. I feel that they must be somewhere in these haunted halls because it was here where my staff broke apart.");
	}
	
	if ($text=~/problem/i) {
		if(defined $qglobals{HelpBaelin} && $qglobals{HelpBaelin} == 1){
			quest::say("There are some gems missing from these pieces, they were magically infused into the oak and I do not know how they disappeared but I cannot conduct my magics with my staff being incomplete. If you [wish to help] me further then I will need you to obtain them.");
		}
	}
	
	if ($text=~/wish to help/i) {
		if(defined $qglobals{HelpBaelin} && $qglobals{HelpBaelin} == 1){
			quest::say("You have come this far now $name, I certainly hope you will not let me down. Please seek out my 4 gems in these cursed halls. When you have gathered the 4 glimmering gems combine them in my gem kit and return the result of your work to me.");
			quest::summonitem(61197);#Baelin's Gem Kit 
		}
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 61172 => 1, 61173 => 1, 61174 => 1, 61175 => 1)) {#Staff of Suffering 1-4
		quest::say("These are indeed the pieces that I seek. It is amazing that you were able to obtain these staff pieces and I am very grateful. Unfortunately there is a [problem].");
		quest::setglobal("HelpBaelin",1,0,"F");

	}
	
	elsif(plugin::check_handin(\%itemcount, 61198 => 1)) {#Baelin's Enchanted Gem
		quest::say("Mortal, I am in your debt.  Take this.  I will now be free!");#Text made up
		quest::summonitem(61180);#Black Enchanted Amulet
		quest::delglobal("HelpBaelin");

	}
   
	else {
		plugin::return_items(\%itemcount); #return items if not the ones required
	}
}#END of FILE Zone:chardokb ID:277082 --Baelin_Xir-Rixoan.pl
