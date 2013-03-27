 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Trelak
## ID: 300040
## ZONE: wallofslaughter
##
############################################

sub EVENT_SAY
{
	if($faction == 1)	#must be ally to do the quest
		{
		if($text=~/hail/i)
			{
			quest::say("Hail, fair traveler. What can I, Nerask, do for you? I know that you present little threat to me for I have heard whispers and rumors about strangers who would help us. I am naught but a poor serf without a [master].");
			}
		if($text=~/master/i)
			{
			quest::say("My master, Patorav, was a great man . . . A wise and kind one, he was. Now I am all alone for I am guilty of betraying his trust during the times of darkness. When the Muramites came he protected me by hiding me amongst some rubble, but I should have protected him . . . Should have done something. My master was so kind to me. Please do me a favor so that I may serve him one last time. I need to gather my master's favorite [belongings] to give his soul peace, but as a poor serf I stand little chance of doing so.");
			}
		if($text=~/belongings/i)
			{
			quest::say("I have much of my master's old clothes that I think will be good for you. As it befits our customs, we pay respects to our dead by honoring their deeds and favorite things. I have clothes for your [head], [arms], [wrists], [hands], [chest], [legs], and [feet] that I will give to you if you return his favorite items that were stolen from his home after he was taken away.");
			}
		if($text=~/head/i)
			{
			quest::say("My master used to have a walking stick that he took on many journeys with him. He told me that it contained a jewel at the top of the staff that was the essence of a whispering spirit which would guide him on his long journeys. I do not know where my master got the stick from as he had it long before I entered into his service. Please return his walking stick to me as it truly was one of his most-favored possessions. I will also need two small bars of Nashtar berry soap so I may clean and preserve it as I once used to. Do this and I shall give you an enchanted cap befitting a dragorn elder.");
			}
		if($text=~/arms/i)
			{
			quest::say("After my master was taken away with many of our other nobles and elders, his house was ransacked by all manner of foul Muramite. One such being took a locket that was given to my master by his father that was in a special pouch. This pouch was no doubt also stolen for the embossing it contained. It was truly fine work indeed. Bring me this pouch so I may retrieve my master's locket from within it and I will give you some fine cloth sleeves that my master wore when performing his duties as a dragorn elder. In addition, I will need two spools of Balemoon silk thread which I will use to size the sleeves to you.");
			}
		if($text=~/wrists/i)
			{
			quest::say("My master used to work with Rurof the Negotiator . . . yes, the very same Rurof that struck a deal with the riftseekers to close the portal that had appeared in the Bloodfields. So on that appointed day, when our remaining forces marched upon the Muramite force stationed near the portal, a bloody battle ensued. Though our valiant warriors were vastly outnumbered, their courage and skill allowed them to turn the tide against the invaders. Then the portal collapsed and exploded, destroying everything in its path -- Muramites and dragorns. We are not sure why this happened, but I think we were betrayed by the riftseekers. Bring back one of these riftseeker hearts and two riftseeker trinkets so I know we have struck back at them. Do this and I will give you an enchanted cloth bracer that befits a dragorn elder such as my master.");
			}
		if($text=~/hands/i)
			{
			quest::say("My master had a famous nephew by the name of Makyah. He was also known as Makyah the Fierce, one my people's most celebrated warriors. He fell during a tremendous battle against the Muramites and to honor him, one of my master's last wishes was to recover his axe. I will give you a pair of enchanted cloth gloves if you find me this axe and two Kuuan whetstones so I may honor Makyah, and thus my master.");
			}
		if($text=~/chest/i)
			{
			quest::say("Just before my master was marched through the causeway with the other nobles, he was very busy writing and receiving important communications from other elders. In fact, just a few days prior to being taken, he told me that he was expecting a note that could change the very face of the war. The carrier of this message was none other than Jayruk himself. No one knows what happened to Jayruk because he did not show up with the note. I will give you my master's ceremonial robe if you can find Jayruk's vest and bring it back to me. I am sure that hidden within it lies the note my master was so anxious about. In addition, I will need three pieces of Vrenlar fruit which I will need to uncover the hidden message.");
			}
		if($text=~/legs/i)
			{
			quest::say("Upon becoming a lauded elder, my master was given a ceremonial amulet recognizing his status. Though it was not magical in the least, he did not cherish it any less. After my master was taken, our house was ransacked and one of the Muramites took the amulet as a trophy. Return this amulet to me and three pieces of softened feran hide so I may create a small pouch to protect the amulet.");
			}
		if($text=~/feet/i)
			{
			quest::say("I have heard that the Muramites have taken over the labyrinth used by our elders. This was once a serene retreat where our elders would meditate and be guided by the spirit of the Great Father. Now, the labyrinth is infested with Muramites. They call it their 'Proving Grounds' where they test their viciousness. The vilest of them are rewarded with Muramite Cruelty medals that signify that they destroy everything they touch. I want you to return one of these medals to me so that at least one of these dark creatures has been suitably dealt with. Also, bring me two Ikaav tails so I know that these vicious creatures have also been dealt a blow.");
			}
		}
	else
		{
		quest::emote("does not respond to you."); #made up text
		}
		}

sub EVENT_ITEM
{
	if($faction == 1 && ($class eq "Enchanter" || $class eq "Magician" || $class eq "Necromancer" || $class eq "Wizard")) #must be ally to do this quest and a safeguard to stop non casters getting their items eaten
	{
	if (plugin::check_handin(\%itemcount, 51475 => 1, 51503 => 2)) #helm
		{
		quest::emote("reaches out for the stick. 'Yes, this is indeed his favorite walking stick! Why here at the top is the jewel I spoke of. Even now, I can hear the spirit in the gem calling out for my master, searching for him. And the soap will allow me to clean and preserve the wood as I used to before The Darkening came upon us. Here is the cap I spoke about. It, like much of my master's clothes, was tailored by a famous dragorn that has long since disappeared since the start of the war.'");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70944);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70930);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70937);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70923);
				}
		}
	if (plugin::check_handin(\%itemcount, 51479 => 1, 51507 => 2)) #arms
		{
		quest::say("Yes, I believe this is the pouch.' He opens it up and begins to rummage through the contents. 'Ah, this is the locket I spoke of. Truly, I am closer to giving my master the peace his spirit searches for. With the thread I will be able to perform the minor tailoring work required to fit these sleeves to you.' He hands you the sleeves after a few minutes.");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70945);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70931);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70938);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70924);
				}
		}
	if (plugin::check_handin(\%itemcount, 51480 => 1, 51508 => 2)) #wrist
		{
		quest::emote("opens his eyes wide as you hand him the heart and trinkets. 'If I did not see it for myself, I would have never imagined that an enemy so powerful and mysterious as these riftseekers could be defeated. My people and I thank you for this act . . . an act that will surely help to embolden us to strike back against the invaders. For your efforts, here is the cloth bracer I spoke about. I am certain it will aid you on your journey.'");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70946);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70932);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70939);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70925);
				}
		}
	if (plugin::check_handin(\%itemcount, 51481 => 1, 51509 => 2)) #hand
		{
		quest::emote("opens his hands for the axe and the two stones. 'Thank you. For helping to fulfill my master's last wishes, I will give you the gloves I spoke about earlier. I know only that they are magical and therefore will have to let you uncover the secret to unlocking their power.'");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70947);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70933);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70940);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70926);
				}
		}
	if (plugin::check_handin(\%itemcount, 51476 => 1, 51504 => 3)) #chest
		{
		quest::emote("takes the vest and begins to examine it thoroughly. 'Yes, I think this small seam here conceals the note my master was waiting for. Ah, this is it, I am certain.' He takes the note, unfolds it, and places it on its side. He takes the fruit and begins to mash it up into a bowl while adding a few other ingredients. Moment later a small plume of blue-gray smoke begins to rise up out of the bowl. Nerask picks up the note and reads it. 'Thank you, I will give this note to our remaining elders. It is very important, indeed. Here is the robe I spoke about. The powerful magic woven into the very fibers should enable you to overcome powerful enemies.'");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70949);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70935);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70942);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70928);
				}
		}
	if (plugin::check_handin(\%itemcount, 51477 => 1, 51505 => 3)) #leg
		{
		quest::emote("holds the amulet up to the sky. 'Yes, this is the amulet my master was so proud of. It signified his elevation to a respected elder for all of the selfless work my master had done for our people. I will take these hides and get a tanner to create a small ornamental pouch befitting it. Take these mystical cloth leggings my master often used in performing his duties.'");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70950);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70936);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70943);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70929);
				}
		}
	if (plugin::check_handin(\%itemcount, 51478 => 1, 51506 => 2)) #feet
		{
		quest::emote("smiles widely as you show him the medal and the wings. 'Yes, now at least a small measure of justice has been exacted for my people. Please take these footwraps that accompanied my master on so many journeys.'");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70948);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70934);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70941);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70927);
				}
		}

  	}
	plugin::return_items(\%itemcount);
}
#END of FILE