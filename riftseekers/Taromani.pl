 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Barowsar
## ID: 301028
## ZONE: bloodfields
##
############################################

sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Greetings, $name. You have certainly traveled far from home. To what does Taromani owe the pleasure of this visit? Have you come to tell me a [" . quest::saylink("story") . "]?");
		}
	if($text=~/story/i)
		{
		quest::say("Splendid! I relish an opportunity to swap tales with mortals. Allow me to go first. In a shattered realm, there existed a twisted overlord that ruled all. He laid waste to entire worlds, destroying or consuming whatever he touched. Those that resisted his influence were quickly annihilated or enslaved. His lands were governed with an iron fist and later abandoned when they no longer served his purpose. This overlord was universally feared and despised. Yet, while his presence was eternally felt, the despot was rarely seen. He had sealed himself away in his citadel in the sky, flanked by his most trusted underlings. None [" . quest::saylink("dared challenge") . "] him there.");
		}
	if($text=~/dared challenge/i)
		{
		quest::emote("smirks and continues, 'The reason no one challenged the overlord was because his realm was fatal to all but a select few. The forces of chaos magic present there would tear most beings to shreds. Only with the proper protection could a mortal hope to enter the citadel of Anguish and survive the experience. It was the ultimate defense against invasion. However, there was a [" . quest::saylink("flaw") . "] in the overlord's plans.");
		}
	if($text=~/flaw/i)
		{
		quest::emote("licks her lips and whispers, 'The overlord failed to consider what would occur if a certain $race named $name were to do a few favors for a Pyrilen named Taromani in return for her protection. Now it's your turn to finish the story. How does it end? Does the $race assist with the [" . quest::saylink("favors") . "]?");
		}
	if($text=~/favors/i)
		{
		quest::summonitem(52414);
		quest::say("Very good. A life in Mata Muram's army is a dangerous one - often nasty, brutish, and short. He must regularly replenish his ranks, promoting the most talented individuals of the lower tiers to replace those that have fallen. Seek out and eliminate these promising soldiers, the up-and-coming members of his forces. Bring me their insignias in this case to prove completion. This will slow down their progress considerably. When you have done what I have asked, I will follow through with my part of the bargain and provide you with the protection you need to access his citadel.");
		}
}

sub EVENT_ITEM
{
	if (plugin::check_handin(\%itemcount, 52415 => 1))
		{
		quest::setglobal("oow_rss_taromani_insignias", 1, 5, "F");
		$client->Message(15,"You are now protected from the chaos magic in Mata Muram's citadel.");
		quest::say("Yes, you haven't disappointed me. This is exactly what I was hoping to see, $name. Mata Muram's forces will be hampered considerably. Now for your reward. . .' She kisses her palm and reaches forward, pressing the hand against your cheek. The skin is warm, almost unbearably so. You feel queasy for a moment, and when the sensation passes she withdraws her arm. 'You'll soon discover that his impenetrable defenses aren't so impenetrable after all. Soon you will be seeing the world through the shroud of Anguish.");
		}
}