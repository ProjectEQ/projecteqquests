# First berz. epic conversaion.
# Lake of Ill Omen
# Only for berz. Class
# 9/13/07
#quest::delglobal("berserk_epic");
sub EVENT_SAY {
	#epic 1.5
	if($qglobals{berserk_epic} >=1) {
	#have Raging Soul Shard
		if($text=~/hail/i && $qglobals{berserk_epic} ==1 && plugin::check_hasitem($client, 11999)) {
			quest::emote("appears to be lost in this own thoughts, mumbling to himself occasionally, and barely acknowledging your existence. Just as you're about to speak again, he says, 'Ach, ya have to forgive me absentmindedness, friend. I've been rather busy pondering [matters] at hand.");
		}
		if($text=~/matters/i && $qglobals{berserk_epic} ==1 && plugin::check_hasitem($client, 11999)) {
			quest::say("Since the recent discovery of the portal on Taelosia, we've been finding many different types of ores, plants, and minerals that were unlike anything we'd ever seen before. These materials have been used to craft simple weapons, potions, and sometimes even been used in various recipes for. . .uh. . .some interesting dishes. Yet I believe that they can be used for [something] much, much more.");
		}
		if($text=~/something/i && $qglobals{berserk_epic} ==1 && plugin::check_hasitem($client, 11999)) {
			quest::say("Some of these materials were of a quality that I feel can be used to craft implements of incredible power and perhaps these [materials] can even be incorporated into the processes used to craft the Axe of Ire to create an even more durable [weapon].");
		}
		if($text=~/materials/i && $qglobals{berserk_epic} ==1 && plugin::check_hasitem($client, 11999)) {
			quest::say("Smiths have used many different types of tempering materials, from water to plant extracts to even blood from exotic animals on occasion. Why I've even heard about one legendary smith using the tears of a god! But given the magical properties of the ore that yew are collecting for me, I suspect that the plants and even some of the animal have been affected by the same type of magic. It is my theory that if we combined the [ore] with [blood] and [extracts] from the plants and animals of Taelosia, we would increase our efforts doubly.");
		}
		if($text=~/ore/i && $qglobals{berserk_epic} ==1 && plugin::check_hasitem($client, 11999)) {
			quest::say("I thank ye for volunteering. The ore I seek comes form the areas closest to where the portal to Discord was originally opened. Ore from this area, I've been told, seems to be the purest form available. Once yew've gathered 4 pieces of this ore, return to me so that I may continue my research.");
		}
		if($text=~/blood/i && $qglobals{berserk_epic} ==1 && plugin::check_hasitem($client, 11999)) {
			quest::say("There are many different types of creatures lurking throughout all of Taelosia though two intrigue me the most. . .the cragbeasts and the hynids. In order to craft the various tempers that I need, I will require 4 vials of blood from each of these creatures.");
		}
		if($text=~/extracts/i && $qglobals{berserk_epic} ==1 && plugin::check_hasitem($client, 11999)) {
			quest::say("Taelosia is vibrant with some of the most exotic plants known to Norrath, with nary a tree in sight. That in and of itself is a bit unusual but the plant-life that does exist in Taelosia seems to be very potent in nature. Gather 4 samples from two different plants and return to me once this has been done.");
		}
		if($text=~/weapon/i && $qglobals{berserk_epic} ==1 && plugin::check_hasitem($client, 11999)) {
			quest::say("Ever since I've heard stories about these materials, I've been working on various designs for a new axe. . .trying to figure out how one could imbue it with the essence and spirit of a true berserker. Unfortunately I have been unable to get my hands on any raw ore of a high enough quality to experiment with.");
		}		
	  }
	  #epic 1.0
	  else {
		  if($text=~/hail/i && $class eq "Berserker" && plugin::check_hasitem($client, 68299) && $berserk_epic == undef) {
			quest::say("Its good to see you again, friend. It seems my axe has fared well thus far, aye? Indeed it has. Hav eyou spoke with your guildmaster yet? They will be glad to see that you are on your path towards controlling your rage.");
			quest::setglobal("berserk_epic", 1, 5, "F");
		  }
		  if($text=~/hail/i && $class eq "Berserker" && $ulevel > 45 && $dragon == undef && $imp == undef  && !plugin::check_hasitem($client, 68299)) {
			quest::say("Aye, I see a familiar look in yer eye. Ye are much like me, friend. If ye truly wish to [master the fires] within ye and become a true berserker, ye must learn many lessons.");
		  }
		  if($text=~/master the fires/i && $class eq "Berserker" && $ulevel > 45 && $dragon == undef && $imp == undef) {
			quest::say("Much as ye are now, I was once saddled with unbridled rage, and now with age and experience, I have learned to master the power that comes with my anger.");
			quest::say("Once ye have mastered yer abilities, ye will be rewarded with a gift that only a true berserker can control. It is a gift that will harness yer rage and use it to yer advantage. This is why ye must walk the same path I did in me youth. Do ye wish to take this [great stride]?");
		  }
		  if($text=~/great stride/i && $class eq "Berserker" && $ulevel > 45 && $dragon == undef && $imp == undef) {
			quest::say("Ye do understand there is no turning back? I hope so. This is a journey -- and sometimes a long one -- depending on what ye've leared so far. Yer skills and wisdom in battle will be tested. Go talk to an old, fallen friend of mine, Lingering Axefall. We call him that because he reguses to let his spirit rest. He failed his task and remains bound here to lead others into the trial he lost. Be wary, though. He is elusive.");
			quest::say("The foe he stood against and lost to still wishes to extinguish his spirit. Take this axe and give it to him so he will know that ye are ready for the test and that I sent ye. Also, take this medal with you. It will help me keep track of your progress. Best of luck, friend.");
			quest::summonitem(60189);
			quest::summonitem(60190);
		  }
		  if($text=~/hail/i && $ulevel < 46 && $class eq "Berserker") {
			quest::say("Return once you have trained more, young Berserker.");
		  }
		  if($text=~/challenge/i && plugin::check_hasitem($client, 60194)) { #Check for Medal of Mirages
			quest::say("The challange is for ye, and ye alone. If you have anyone try to assist ye, ye will fail. Do not attempt to cheat yerself of yer own development. Ye must seek out Mardic Crimsonsteel and get his guidance. He will prepare ye to fight a mirage of a berserker that has been created through years of refined magic. I cannot tell ye the source of such magic, but ye must know that I used that mirage as me sparring partner, constantly improving me skills against it and advancing. Perhaps now it's yer turn to face it... alone. Take this sealed note to Mardic. It will give him instructions for yer test.");
			quest::summonitem(60195); #Sealed Note for Mardic
		  }
		  if($text=~/strategize in battle/i && plugin::check_hasitem($client, 60198)) { #Check for Medal of Strategy
			quest::say("One of the best strategists I've ever met is ready and willing to help any who attempt to prove their skills in battle. Seek out Treanik Ireblade. She won't give ye any advantage, however. This is yer fight to win, not hers, though she'll be itchin' to get her blade bloodied. Take this note and give it to her.");
			quest::summonitem(60199); # Note for Treanik
			$dragon=undef;
		  }
		  if($text=~/ready/i && $ulevel > 45 && $class eq "Berserker" && $imp == 1) {
			quest::say("Eager one, aren't ye? Good to see, but do not underestimate how volatile our rage is. In me youth, it snuck up on me and in a blind rage, I had slain me sparring partner. It was then that I knew I was different and shouldn't keep close friends until I'ad my rage under control. There are some, though, that will [never control the rage].");
		  }
		  if($text=~/never control the rage/i && $ulevel > 45 && $class eq "Berserker" && $imp == 1) {
			quest::say("Well, you see, the fire that drives the rage through us and into our muscles and minds can burn out of control in come creatures. I have encountered several in my travels, aye. They are merciless and blind to the rage, which makes 'em poor at strategy, but deadly in combat. Ye will have to [face one] of 'em so that ye may learn how dangerous ye can truly become if ye do not complete these trials and master the rage. I do 'ope ye appreciate this lesson.");
		  }
		  if($text=~/face one/i && $ulevel > 45 && $class eq "Berserker" && $imp == 1) {
			quest::say("This creature is unlike any you have seen wandering the lands. this beast is fearsome and ethereal. It strikes out with its rage without thought or care. Ye must learn to recognize this type of beast if ye are to learn how to master it and yer own abilities. It will try to disguise itself so ye don't recognize the fury it holds within it -- it has an [enraged essence] within it and I want ye to bring it to me. Remember, $name, do not be fooled and always be aware.");
		  }
		  if($text=~/enraged essence/i && $ulevel > 45 && $class eq "Berserker" && $imp == 1) {
			quest::say("I will give ye no more hints. Ye must seek this creature out alone. Look far and use your mind and brawn to beat it. Yer noggin will give ye an advantage o'er this un.");
			$imp=undef;
		  }
		 if($text=~/do/i && ($hunting == 1 || plugin::check_hasitem($client,60204))) { #Hunting stage complete 
			quest::say("For my mirage to remain part of my trials, I need some very specific reagents. There is a sickly gorilla that carries a rotting organ which I am in need of. Also, I need a paw of a very special and dangerous kobold. Lastly, bring me the poison sac of a dangerous spider. A potion that allows us to create a gate from one place to another is also required. If ye believe ye can do this for me, tell me so, and I will give ye a bag to hold them in. When ye have all of the ingredients, combine them in the bag I've given ye, and bring it back to me. Good luck in your hunt!"); 
			quest::summonitem(60205); 
			$hunting=undef; 
		  } 
		  if($text=~/next challenge/i && ($mastery == 1 || plugin::check_hasitem($client,60210))) { 
			quest::say("For this encounter, ye must be prepared for the unexpected and, in the face of chaos, be able to focus on the task at hand. Yer stamina will also be tested. When I first encountered this wicked trap in me travels, even I had to attempt it a couple of times. However, I do have faith in ye. With my advance warning, ye shouldn't be caught off guard. This challenge will also prove how loyal and skilled yer own friends are. One thing is for certain, ye can't complete this [next test] alone."); 
		  } 
		  if($text=~/next test/i && ($mastery == 1 || plugin::check_hasitem($client,60210))) { 
			quest::say("Make your way to the woods in Kunark. Use the hunting skills ye have gained to find a most unusual and war-hungry creature. It has a very unique magic in its battle repertoire that will definitely test yer mettle. Off with ye, then. I do hope I see ye again...I've become quite fond of ye. I recently sent another like ye to do this trial and I haven't heard from him..."); 
			$mastery=undef; 
		  } 
		}
}	

		
sub EVENT_ITEM {
#1.0 turnins
  if (plugin::check_handin(\%itemcount, 60192 => 1, 60190 => 1)) { #Bloodbeast Tooth, Medal of Blood
    quest::say("Aye, ye have done well, $name. However, that was a simple task and I'm sure ye had much help with it. Now ye must go alone. Ye may want to take some bandages with ye and be sure yer skill with them is top-notch. Ye'll likely need 'em. Here, take some o'mine. Ye may find 'em to be most useful. Do ye believe ye're [ready for this challenge]");
    quest::summonitem(60193, 3); #McArik-Crafted Bandage
    quest::summonitem(60194); #Medal of Mirages
  }
  elsif(plugin::check_handin(\%itemcount, 60196 => 1, 60194 => 1)) {
    quest::say("Well, I am indeed hopeful and pleased about yer progress, $name. Ye should be proud that you have now attained the Medal of Strategy. Well done, indeed! It seems that ye can best yer equal now. The next test of yer masters of yer abilities is much more difficult, however, and may require ye to ask yer friends for some 'elp... but it must be the right kind of 'elp. This test will determine how well ye [strategize in battle]. Ye must gather trustworthy friends and they must be willing to work under yer command.");
    quest::summonitem(60198);
	$dragon=1;
  }
  elsif(plugin::check_handin(\%itemcount, 60201 => 1, 60198 => 1)) {
    quest::say("Ye are well on the way, me friend. I knew the moment I saw ye that ye were going to get through this. I'm just not convinced that yer as powerful as even ye may think. So, are ye [ready] for the next trial ye must face?");
    quest::summonitem(60202);
    $imp=1;
    quest::settimer(1,1000);
  }
  elsif(plugin::check_handin(\%itemcount, 60202 => 1, 60203 => 1)) {
    quest::say("I am indeed impressed by yer control and ability to best such a horrific beast, my friend. Ye are certainly well on yer way to mastering yer rage and taking advantage of the abilities ye were born with. Here is your Medal of Hunting. Ye are nearly there -- nearly complete with yer trials, but there are a few more things ye [must do] for me. ");
    quest::summonitem(60204);
    $hunting=1;
  }
  elsif(plugin::check_handin(\%itemcount, 60209 => 1, 60204 => 1)) {
    quest::say("Wonderful. Ye have earned yer Medal of Mastery, but ye are not done yet. There is one final test ye must complete before I can recognize ye as a true berserker. Ye must prove that in the face of great adversity, ye can keep yer wits about ye. This final test, naturally, is the most difficult, but I would not present this [next challenge] to ye if I thought ye could not finish yer journey.");
    quest::summonitem(60210);		
    $mastery=1;
  }
  elsif(plugin::check_handin(\%itemcount, 60210 => 1, 60211 => 1)) {
    quest::say("I am so impressed and proud of ye, $name. This had been a long journey, hasn't it? That said, this will be the most important adventure of yer life, for now you are a true berserker and a master of all of yer skills. As I promised, the completion of these trials would not only bring ye the honor of being recognized as a true berserker, but also a weapon only a true berserker can wield -- one that I fashioned myself. Use this weapon in yer travels and may it serve ye well in battle. Be well,$name, the Berserker.");
    quest::summonitem(68299);
	quest::setglobal("berserk_epic", 1, 5, "F");
  }
#1.5 turnins 
#58080 Shimmering Aligned Ore
  elsif(plugin::check_handin(\%itemcount, 58080 => 4)) {
    quest::emote("eyes open wide in excitement as you hand him the 4 pieces of ore. 'Very good work indeed, young berserker!' As he examines each piece one at a time, he nods slowly, his smile widening each time, 'These pieces will do very well, no doubt. I will hold onto these until yew manage to bring me the rest of the components.");
	quest::setglobal("berserk_epic_ore", 1, 5, "F");
	Check5GlobalSerk();	
  }
#63831 Hynid Blood
  elsif(plugin::check_handin(\%itemcount, 63831 => 4)) {
    quest::emote("takes the samples and slowly examines each one carefully. 'Ah, yes, the cragbeast blood and in very good condition too. This should work quite nicely for my experiment. It is my theory that capturing and utilizing the durability of cragbeasts could help to forge a weapon of unsurpassed durability. I will hold onto to these until yew bring me the rest of the necessary components.");
	quest::setglobal("berserk_epic_hyn", 1, 5, "F");
	Check5GlobalSerk();	
  }
#63832 Cragbeast Blood
  elsif(plugin::check_handin(\%itemcount, 63832 => 4)){
    quest::emote("takes the samples and slowly examines each one carefully. 'Ah, yes, the cragbeast blood and in very good condition too. This should work quite nicely for my experiment. It is my theory that capturing and utilizing the durability of cragbeasts could help to forge a weapon of unsurpassed durability. I will hold onto to these until yew bring me the rest of the necessary components.");
	quest::setglobal("berserk_epic_crag", 1, 5, "F");
	Check5GlobalSerk();	
  }
#16949 Taelosian Fern Sample
  elsif(plugin::check_handin(\%itemcount, 16949 => 4)) {
    quest::emote("begins to ruffle though the leaves holding them up to the light. 'Yes, surely these are the Taelosian Fern extracts I asked you to retrieve. They're far greener than I expected but surely these are the samples. It is said that the winds that roar down from the Taelosian mountains can strip the flesh from a man in but a few fleeting moments. Yet these gentle Ferns manage to survive because of their flexibility allows the winds to pass harmlessly through their branches. It is this essence of flexibility that I hope to capture and use. I will store these safely until yew return with the rest of the components.");
	quest::setglobal("berserk_epic_fern", 1, 5, "F");
	Check5GlobalSerk();	
  }
#15781 Taelosian Tea Extract
  elsif(plugin::check_handin(\%itemcount, 15781 => 4)) {
    quest::say("Yes, the Tea Extract. These are fine samples indeed and should do quite nicely. This extract should help to purify the other components required for the tempering materials. These remaining pure essences should allow us to create an alloy out of the Taelosian Ore that is unmatched. I will hold onto these until you finish bringing me the remaining temper ingredients.");
	quest::setglobal("berserk_epic_tea", 1, 5, "F");
	Check5GlobalSerk();
  }
#4 axes
  elsif(plugin::check_handin(\%itemcount, 18976 => 1, 17833 => 1, 17898 => 1, 17399 => 1)) {
    quest::emote("grabs each axe individually and mutters something inaudible. He takes each axe in his hands and looks them over. 'This axe seems to display almost no wear, which is highly unusual, given the amount of punishment ye must have put it through. Surely all three of these axes are of higher quality than the ones we normally make, but this one is vastly superior. Given the quality of this axe, I'd say that it could very easily benefit from some enchantments. So the next step in this axe's journey should be to imbue it with some of the owner's essence. This will create an axe that can actually become aware of its owner's wishes to help him realize his true Berserker's potential. Why if I were the owner and had a rare Soul Gem handy, I'd be headin' off to Teekan the Enchanter in the Abysmal Sea. Her abilities to weave such magic are unsurpassed.");
	quest::setglobal("berserk_epic", 5, 5, "F");
	quest::summonitem(18976); 
  }  
# 
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  if($timer == 1) { ##incase quest buggs... timer is set for (1000/60) minuites
    quest::stoptimer(1);
    $imp=undef;
  }
}

sub Check5GlobalSerk {
  if($client->GetGlobal("berserk_epic_ore")==1 && $client->GetGlobal("berserk_epic_hyn")==1 && $client->GetGlobal("berserk_epic_crag")==1 && $client->GetGlobal("berserk_epic_fern")==1 && $client->GetGlobal("berserk_epic_tea")==1) { 		
    quest::say("Excellent. I've managed to imbue all of the temper components you brought into the 4 pieces of Taelosian Tempered Ore. Take the samples to Baeldarr Hawkeye who can be found in the Plane of Knowledge. His knowledge and artistry of smithing is unmatched. Surely he can tell us the value of what we have created here.");
	quest::summonitem(15793); #Taelosian Tempered Ore
	quest::summonitem(17589); #Taelosian Tempered Ore
	quest::summonitem(17319); #Taelosian Tempered Ore
	quest::summonitem(17496); #Taelosian Tempered Ore	
	quest::delglobal("berserk_epic_ore");
	quest::delglobal("berserk_epic_hyn");
	quest::delglobal("berserk_epic_crag");
	quest::delglobal("berserk_epic_fern");
	quest::delglobal("berserk_epic_tea");
	}
}

#EndFile lakeofillomen\Keras_McArik.pl ()