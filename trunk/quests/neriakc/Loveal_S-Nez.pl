#Loveal_S-Nez.pl
#Sir Lindeal's Testimony/Thex Mallet/SK Trainer

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("What is this I see before me? A would-be hero of the Dead? You reek of false bravado. I have seen others much stronger than you meet their fate at the end of a blade. I see no reason to continue our conversation. How can one such as you assist with my [delegated duties]?");
	}
	if($text=~/delegated duties/i){
		quest::say("Why do you ask? I know why. Glory has captured your affections. Those who seek glory find death. Still, you may be of some use. Before I assign you a task, I must be assured of your power. I require you to [perform a test].");
	}
	if($text=~/perform a test/i){
		quest::say("In the Lavastorm Mountain Range there have been sightings of a paladin, one Sir Lindeal. He has compromised our routes between.. well, that is none of your concern. All you need to know is that this paladin of the Temple of Marr must be sent to his everlasting life. Do so and prove your worth to us. I await your proof. Use no assistance. If you are truly his equal then I shall know. I know all.");
	}
	if($text=~/appointed tasks/i){
		quest::say("Very well. You have gained the appropriate power. I require you to journey to the Commonlands and seek out Kizdean Gix. He is a member of a very important force. Tell him 'Utalk Adarev Otcin'. Remember this password.");
	}
	if($text=~/Thex Mallet/i){
		quest::say("All you can know is that the Thex Mallet is desired by our Queen. If we are not successful in its retrieval, it will be our heads which adorn her trophy room. We have learned its location and believe it to be broken into three separate pieces.");
	}
	if($text=~/Queen Cristanos Thex/i){
		quest::say("The Queen of the Teir'Dal is the most powerful of all. It is she who should sit on the throne and not King Naythox. The Dead are her humble servants. We await the day when she shall finally take her rightful position as ruler of Neriak.");
	}
	if($text=~/King Naythox Thex/i){
		quest::say("A competent and powerful warrior, but a warrior nonetheless. He has suppressed the true glory of the Teir'Dal. Perhaps it is time for a new ruler of Neriak.");
	}
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18828 => 1)){#Testimony
		quest::say("So you have succeeded where others have failed. You show promise. Take this then. You shall be a valuable asset to the Dead and soon this shall be of value to one so great. This will help you on your way. Are you still interested in my [appointed tasks]?");
		quest::summonitem(2317);#Cloak of the Undead Eye
		quest::givecash(0,14,0,0);#14 silver
		quest::exp(33750);#1% level 16 exp
		quest::faction(322, 5); #The Dead
		quest::faction(268, 5); #Queen Cristanos Thex
		quest::faction(177,-10); #King Naythox Thex
		quest::faction(170,-10); #Keepers of Art
		quest::faction(91,-10); #Eldritch Collective
		quest::faction(260,-10); #Primordial Malice		
	}
	if(plugin::check_handin(\%itemcount, 13390 => 1)){#Thex Mallet
		quest::say("Oh how grand it is!! Look at it!! I feel the power trembling within. Who would have thought such an item would be abandoned? You have performed supremely. Queen Cristanos shall reward me greatly and I shall reward you greatly. Here is my weapon from years past.. the Reaper of the Dead. I believe it has one soul still trapped within.");
		quest::summonitem(5374);#Reaper of the Dead
		quest::givecash(0,14,0,0);#14 silver
		quest::exp(33750);#1% level 16 exp
		quest::faction(322, 5); #The Dead
		quest::faction(268, 5); #Queen Cristanos Thex
		quest::faction(177,-10); #King Naythox Thex
		quest::faction(170,-10); #Keepers of Art
		quest::faction(91,-10); #Eldritch Collective
		quest::faction(260,-10); #Primordial Malice		
	}
  	#do all other handins first with plugin, then let it do disciplines
  	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  	plugin::return_items(\%itemcount);
}#END of FILE Zone:neriakc  ID:42043 -- Loveal_S`Nez 
