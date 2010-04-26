## Initiate Dakkan
##
## Created on April 24, 2010 by mrhodes
#
## Quests: Ways of nature
##		   Diseased Spiders   
##         Snake Sacs
##		   Welcome to Crescent Reach (Part of this quest)


sub EVENT_SAY {
	if($text=~/hail/i)
	{
		if(quest::istaskactivityactive(184, 1))
		{
			quest::updatetaskactivity(184,1);
			quest::say("Thanks so much for your help.");
			quest::me("Dakkan is very grateful for your help as he surely could not have done it alone!");
			quest::summonitem(53483,5);
			quest::exp(500);
			quest::ding();
		}else {
			if(quest::istaskactivityactive(204,1))
				{ quest::updatetaskactivity(204,1); }
			quest::say("Vasha, newcomer. Ah, yes, 'vasha' is what we drakkin say when we greet each other. It is a word taken from the dragon language. There is so much to learn! One of the first things I learned when I awoke from my human-sleep was the ways of nature. Would you like to [learn]?");
		}
	}
	
	if($text=~/learn/i)
	{
		quest::say("My dragon father, Venesh the Greenblood, passed wisdom onto me so that I may instruct you. You must venture into the world and learn more about this place and your own strengths. There are a few [tasks] for you to complete if you are willing.");
	}
	
	if($text=~/tasks/i)
	{
		quest::say("The ways of nature are often confounding, as Venesh, my great dragon father, says. There are some curious [mushrooms], dangerous types of [venom sacs] and [diseased spiders] we must study!");
	}
	if($text=~/mushrooms/i)
	{
		quest::say("You must gather some mushrooms from the Mushroom Grove in the Hollow outside the city. If you could gather mushrooms for me, I can give them to Venesh to study. He will be so pleased! Are you [interested]");
	}
	if($text=~/interested/i)
	{
		if(!quest::istaskactive(182))
		{	
			quest::assigntask(182);
			quest::say("Excellent, $name! Return the mushrooms to me so I can give them to my father. Perhaps I can reward you when you return!");
		}else {
			quest::say("You are already helping me gather 5 mushrooms...");
		}
	}
	
	if($text=~/venom sacs/i)
	{	
		quest::say("Renn, $name. Oh, I should explain. Renn means 'welcome!' I often forget many don't know our words yet. Venesh has passed down another teaching. Now he wishes you to collect poison sacs from the snakes in the Hollow. Of course, to get the sacs you have to kill the snakes. It's not an easy task for a youth, but did you want to [try]?");
	}
	if($text=~/try$/i)
	{
		if(!quest::istaskactive(183))
		{	
			quest::assigntask(183);
			quest::say("Good, good. I knew I could count on you, $name. Bring the sacs back to me when you're done so I can give them to Venesh for his perusal. I'd also appreciate any pointers on how you killed the snakes! Udra, friend. Return safely. Oh yes, udra means 'goodbye!");
		}else {
			quest::say("You must finish collecting the Snake Sacs first.");
		}
	}
	
	if($text=~/diseased spiders/i)
	{	
		quest::say("My father has given us a great challenge as our final task in learning the ways of nature here. In the Hollow there are some spiders that have gotten a grim illness. They hide, but Venesh told me if I kill some healthy spiders in the area, it might draw the ill ones out of hiding. Are you up for [it]?");
	}
	if($text=~/it$/i)
	{
		if(!quest::istaskactive(184))
		{
			quest::assigntask(184);
			quest::say("Off you go then! May Veeshan guard you!");
		}else {
			quest::say("you still have some spiders to kill.");
		}
	}
}


sub EVENT_SIGNAL {
	if($signal eq "1")
	{
		quest::say("Thanks so much for your help.");
	}
}
