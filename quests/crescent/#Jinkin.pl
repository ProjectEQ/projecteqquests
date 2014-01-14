## Jinkin - ID: 394202
## Created on April 26, 2010 by mrhodes
#
## Quests: 	Cap of Color 
##			Here Kitty, Kitty! 
##			Thrills and Quills
##

sub EVENT_SAY {
	if($text=~/hail/i)
	{
		quest::say("'Vasha, $name. Browse my wares and let me know if you need anything. Nothing catches the eye more than one of my fine rings or bracelets. It is said my human lineage is that of jewelers. I'm still a neophyte at this craft, but soon I will master it, matching the skills of my family. If you do not plan to buy something, perhaps you could [". quest::saylink("help") . "] me?");
	}
	
	if($text=~/help/i)
	{
		quest::say("Karui, friend. Or, thank you, rather. While crafting my wares, I fail now and again, and I'm running a little short on some supplies. If you help me get [". quest::saylink("more") . "] I would appreciate it, and perhaps be able to reward you.");
	}
	
	if($text=~/more/i)
	{
		quest::say("Currently, I'm in need of supplies to create more [". quest::saylink("necklaces") . "] and [". quest::saylink("bracelets") . "]. I'm also using natural [". quest::saylink("dye") . "] to adorn them with the drakkin emblem of the Six.");
	}
	
## Cap of Color
	if($text=~/dye/i)
	{
		quest::say("Just about everything can use a little more color, don't you think? You should have seen Crescent Reach before we got here. Dull drab grey everywhere, yuck! At any rate, I've been using natural dyes to spice up my designs, and I think I might know where to find some [". quest::saylink("special") . "] bright colors.");
	}	
	if($text=~/special/i)
	{
		quest::say("The mushrooms in the grove are so vivid and colorful. I could make a beautiful eye-catching dye with them. If I could get six mushroom caps it would be a great help. Will you [". quest::saylink("grab") . "] some for me?");
	}	
	if($text=~/grab/i)
	{
		if(!quest::istaskactive(185))
		{
			quest::say("Karui, $name. I will greet you with open arms when you return with the caps.");
			quest::assigntask(185);
		} else {
			quest::say("I'm still waiting for you to get some mushroom caps for me.");
		}
	}
	
## Here Kitty, Kitty!	
	if($text=~/necklaces/i)
	{
		quest::say("The necklace is made out of the sharp fangs of the cave cats that live in the Hollow outside the city. While the creatures may be vicious, their teeth make lovely ornaments. It takes me twelve teeth to string one necklace. Will you [". quest::saylink("bring") . "] them to me?");
	}	
	if($text=~/bring/i)
	{
		if(!quest::istaskactive(186))
		{
			quest::say("Karui, friend. I wait with much anticipation. My orders are growing!");
			quest::assigntask(186);
		} else {
			quest::say("I'm still waiting for you to get fangs and teeth for me.");
		}
	}	
	
## Thrills and Quills
	if($text=~/bracelets/i)
	{
		quest::say("'I also make leather bracelets from the hides of creatures. I adorn them with my own design, a skill I feel I may have inherited from my human heritage. The problem is, I'm almost out of hides. Could you go [". quest::saylink("get") . "] ten vermin and bat skins for me? That should be enough for a good supply of bracelets!");
	}	
	if($text=~/get/i)
	{
		if(!quest::istaskactive(187))
		{
			quest::say("Oh, would you? I'm so grateful!");
			quest::assigntask(187);
		} else {
			quest::say("I'm still waiting for the hides from you.");
		}
	}
}