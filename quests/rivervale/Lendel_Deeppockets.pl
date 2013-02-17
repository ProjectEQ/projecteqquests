sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18732)) { 
		$client->Message(15,"As you get your bearings, you see that you are inside the Fool's Gold, the best place in all of Rivervale to have a drink and relax. Before you can reflect on relaxing however, a serious looking Halfling looks your way. 'Hey you! No loitering. What's that you say! You wish to become a Rogue? Well, you are in the right place. I am Lendel. Read the note in your inventory and when you are ready to start your training, hand me your note.'");
  }
}

sub EVENT_SIGNAL {
	quest::say("Find somebody to go see what he wants. I don't like the idea of making Hanns mad at us, but I also don't like the idea of looking over my shoulder for Stanos. He is not somebody I would care to dance with, and I DO owe him.");
}

sub EVENT_SAY {
	if($fatestealer >= 1) {
		if($text=~/hail/i) {
			quest::say("So there you are, $name. You are, of course, preceded by your reputation. I was wondering when I would have the pleasure of receiving your company. Word has it that you're looking for information, and I'm afraid you've come to the wrong bar, friend. The drinks are downstairs and the information is strictly off limits. That is, unless you can take care of a [small job] for me. I might be willing to entertain the notion of overlooking your stature if you can assist me with a special problem.");
		}
		if ($text=~/small job/i) {
			quest::say("One of my girls stumbled across a beverage that should bring in crowds to the Fool's Gold. It's fantastic stuff, really. I am expecting folks to travel all the way from Freeport. But without having even tasted a drop of the stuff, Mayor Gubbin has outlawed it in Rivervale. He won't let me bring in a shipment of ingredients, and my shippers have refused to deliver here anymore after being turned away at the gate so many times - rudely I might add! If you were to brew a bottle of the stuff and convince Gubbin to take a drink, I think he might appreciate it enough to change his mind. Here's the recipe. I'm counting on you, $name");
			quest::summonitem(52333); #Jumjum Twist Recipe
		}
	}
	else {
		if($text=~/hail/i) {
			quest::say("Its nice to meet you $name. Allow me to introduce myself. I am Lendel Deeppockets master Assassin of Rivervale. I am personally in charge of all [training] we have the new recruits go through before they are sent out on specific missions.");
		}
		if($text=~/training/i) {
			quest::say("There are many steps that a young rouge must take on the road to stealth. The most important part of your training is learning how to use the tools around you such as the forge. From the looks of you I can tell you could use some more [enchanted armor] as well so I think this would be a good learning experience.");
		}
		if($text=~/enchanted armor/i) {
			quest::say("I am pleased to hear that you are interested in making your own armor $name. I have some instructions for you so please listen closely. First, I will present you with your Dusty Mail Assembly kit when you are ready. After that, simply tell me what piece of Slickfinger Chainmail you [want] to craft and I will give you a pattern along with a recipe for  [Coifs], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics]. The recipe I will give you for specific items will need to me combined in the assembly kit to create the magical material necessary. Once you have this material and pattern that I gave you when you told me what item you wanted to craft, put both in the nearest forge to create the armor piece you asked for. Here is your Dusty Mail Assembly Kit.");
			quest::summonitem(17247); #Dusty Mail Assembly Kit
		}
		if($text=~/coifs/i) {
			quest::say("Protecting the ole noggin is probably the smartest move you will make young $name. Here is your pattern, once you have combined 2 Bricks of Crude Iron Ore, 2 Ruined Thorn Drakeling Scales and 1 Carrot in your kit place it in a forge along with this pattern to create your Slickfinger Chainmail Coif.");
			quest::summonitem(22671); #Enchanted Coif Pattern
		}
		if($text=~/bracers/i) {
			quest::say("Go out into the thicket and seek out 1 Brick of Crude Iron Ore, 1 Shattered Warbead, 1 Large Yellowjacket Sternite and 1 Milk. Once you have combined them in your kit to fashion the bracer material take it to a forge along with this pattern to create your Slickfinger Chainmail Bracer.");
			quest::summonitem(22672);
		}
		if($text=~/sleeves/i) {
			quest::say("If sleeves are what you wish to craft you will need to collect 3 Bricks of Crude Iron Ore, 3 Honeycombs, 2 Thorn Drakeling Scales and 2 Grapes then combine them in your kit to fashion the necessary material. Take this pattern to the nearest forge with that material to create your Sleeves of the Slickfinger.");
			quest::summonitem(22673);
		}
		if($text=~/boots/i) {
			quest::say("Boots you say $name? Well I think I heard you right but I had to check. Make sure you only wear your boots in case of emergency. All other times you should showcase your feet to the world with pride. You will need to combine 2 Bricks of Crude Iron Ore, 2 Fire Beetle Eyes and 2 Giant Thicket Rat Skulls in your kit to fashion your Slickfinger Boot Material. Once you have done this take the material to a forge along with this pattern to create your Slickfinger Chainmail Boots.");
			quest::summonitem(22674);
		}
		if($text=~/legplates/i) {
			quest::say("I must say that pants are a good idea young $name. Please gather 4 Bricks of Crude Iron Ore, 2 Spiderling Eyes, 2 Large Wood Spider Tarsus, 1 Bottle of Kalish and 1 Ruined Wolf Pelt then combine them in your kit to create your Legplates Material.");
			quest::summonitem(22675);
		}
		if($text=~/gauntlets/i) {
			quest::say("Your gauntlets may possibly be the most important part of armor. One should always be sure that their hands are not exposed, because taking a blow to the hand is a lot worse then getting hurt anywhere else! To create the gauntlet material please collect 3 Bricks of Crude Iron Ore, 2 Bixie Wings, 1 Large Snake Skin and 1 Red Wine.");
			quest::summonitem(22676);
		}
		if($text=~/tunic/i) {
			quest::say("I'm happy to see that your training is coming along so well $name. I have no doubt in my mind that you are ready to craft your tunic. Please collect 5 Bricks of Crude Iron Ore, 1 Giant Wood Spider Femurs, 1 Embalming Dusts, 1 Dark Elf Skin and 1 Giant Yellowjacket Thorax. Come back after you are finished. I have a [job] for you.");
			quest::summonitem(22677);
		}
		if($text=~/job/i) {
			quest::say("Orcs is the job $name. Plain and simple I cannot stand these homewreckers. They have moved into our land and continue to storm our front gate. I seek out bone fragments and fractured jawbones from these nasty Orcs. Once we have 1 of each we will be able to create a weapon for you to use.");
		}
		if($text=~/trades/i){
			quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
			quest::summonitem(51121);
		}
		if($text=~/second book/i){
			quest::say("Here is the second volume of the book you requested, may it serve you well!");
			quest::summonitem(51122);
		}
  }
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 22693 => 1, 22694 => 1)) {
		quest::summonitem(22695);
		quest::exp(200);
	}
	elsif(plugin::check_handin(\%itemcount, 13588 => 1)) {#Rogue 1.5 handin
		quest::say("Well done, $name. With the Mayor's blessing to sell this liqueur in the Fool's Gold we'll make a mint, and there's almost nothing illegitimate about it. Now that we have the formalities taken care of, allow me to tell you something. What I know is fundamental to the idea of creating a perfect blade. It's my pleasure to pass that knowledge on to you. Many people are hung up on the shape and size of a weapon. I'm here to tell you that it's not about size, but overall weight and balance.' Lendel holds out his dagger and balances the point on the tip of his finger. 'You see what I mean, $name? Perfect. In the heat of combat, when every precision strike counts, you can't afford to be wielding an unbalanced bulky blade. I have some notes I've written up on the topic. Here, I'll jot them down in your journal.");
		quest::emote("You have coerced Lendel into revealing his secret");
	}
	elsif(plugin::check_handin(\%itemcount, 18732 => 1)) { #Tattered Note
		quest::say("HA! I asked that fool Denry to send me a professional, and this is what I get?!? Oh diddlepicks! That crotchety old coot never liked me anyway. And after all I've done for him! Hrrmf! Ah well, let's get you started and see what ya got, huh, kid? Here, wear this. Maybe I'll have Toelia break you in, huh? Yeah, that'll work! Go find her, and she'll put you to work. Just remember, we all earn our keep around here, or else it's back to hay farm for you! Oh yeah, tell her you're the [new dishwasher] so she knows you are on the level. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13539); #Old Brown Vest*
		quest::ding();
		quest::faction(77,10); # Deeppockets
		quest::faction(33,10); # Circle of Unseen Hands
		quest::faction(218,-15); # Merchants of Rivervale
		quest::faction(48,10); # Coalition of Tradefolk Underground
		quest::faction(31,10); # Carson McCabe
		quest::exp(100);
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:rivervale  ID:19066 -- Lendel_Deeppockets