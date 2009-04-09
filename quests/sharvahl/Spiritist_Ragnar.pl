#Zone:sharvahl  ID:155198 -- Spiritist_Ragnar

#Hand in For Whiptail Poison Glands

sub EVENT_SAY {

if($text=~/Hail/i){
quest::say("Well hello... How may I help you?"); }

if ($text=~/love potion/i) {
  quest::say("Love potion? Never been done and not worth the risk to try after what happened to Kanaad. ");
}
if ($text=~/what happened to Kanaad/i) {
  quest::say("Old Kanaad taught me a lot of what I know- he was about the greatest potions expert in the city back then. He started gathering legends and lore about some infamous love potion. Not some silly thing to make the girl of your dreams fall in love mind you- this fabled tonic was intended to be shared only between two who had found true love. If their feelings were strong enough it would... well, that was part of the problem, no one knew what it was supposed to do. Kanaad learned of some crazy human in the mountains that had supposedly figured out the secret to the potion. The results were not what anyone had hoped for.");
}
if ($text=~/what were the results/i) {
    quest::emote("shuffles a bit uncomfortably, considering whether or not he should be telling you this");
    quest::say("This is not something that I would normally talk about, but Soroush came by and told me that you are on the trail of Behari- if this will help you find him, then I will tell you all that I know... Kanaad had a time getting the ingredients and was only to make just a very little bit. He sat down with his love, alone in a room and intended to share the elixir. Well, that was the last anyone saw of her, and he was manic, out of his mind... The mixture had driven him from his senses and he snapped. It took quite a bit to restrain him and figure out what to do next.");
}
if ($text=~/what happened next/i) {
  quest::emote("considers you for a moment and, as though reminding himself that you are trustworthy, continues");
  quest::say("Well what we learned was that not only did the mixture drive the drinker mad, but it was incredibly addictive as well- a horrible combination. All that we could do was give him a controlled intake of the potion for his addiction and try to treat his dementia. With his returning sanity came the realization of what he had done to his love. It was the most harrowing thing I have ever seen someone go through in all of my life... He is better now, but has never quite been the same and rarely speaks to strangers. Give him this and you should at least get a chance to explain.");
  quest::summonitem(5990);
}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount,30665=>1)) {
quest::say("A blessing indeed! You have done well to bring this to me. With these glands I will be able to save many lives. Thank you friend. Shar Vahl and its people are in your debt. Please, accept these gifts to assist you in your endeavors. It Is the least I can do to return the favor!");
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::givecash(0,8,0,0);
quest::exp(250);
quest::ding();
quest::faction(132,2);
}
if (plugin::check_handin(\%itemcount,30665 => 2)) {
quest::say("A blessing indeed! You have done well to bring this to me. With these glands I will be able to save many lives. Thank you friend. Shar Vahl And its people are in your debt. Please, accept these gifts to assist you in your endeavors. It Is the least I can do to return the favor!");
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::givecash(0,6,1,0);
quest::exp(500);
quest::ding();
quest::faction(132,4); }

if (plugin::check_handin(\%itemcount,30665 => 3)) {
quest::say("A blessing indeed! You have done well to bring this to me. With these glands I will be able to save many lives. Thank you friend. Shar Vahl And its people are in your debt. Please, accept these gifts to assist you in your endeavors. It Is the least I can do to return the favor!");
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::givecash(0,4,2,0);
quest::exp(750);
quest::ding();
quest::faction(132,6); }

if (plugin::check_handin(\%itemcount,30665 => 4)) {
quest::say("A blessing indeed! You have done well to bring this to me. With these glands I will be able to save many lives. Thank you friend. Shar Vahl And its people are in your debt. Please, accept these gifts to assist you in your endeavors. It Is the least I can do to return the favor!");
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::summonitem(quest::ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592));
quest::givecash(0,2,3,0);
quest::exp(1000);
quest::ding();
quest::faction(132,8); }

if ($itemcount{30602} == 1 && $itemcount{30964} == 1){
quest::say("Well done $name. I hope it isnt too late.");
quest::emote("begins to chant over the carapace and the claw, holding each in opposite hands. A soft light travels from the claw to the carapace as the claw turns to dust. Ragnar opens his eyes and begins to speak.");
quest::say("It has worked, but all we have done is buy ourselves more time. While you were away, I have been speaking to Master Barkhem. He has a shield frame that can support these carapaces. You will need to craft such a shield by including this carapace and into the frame along with enough to fill each slot. You are doing quite well young $name, Siver has grown a little stronger. You can make use of her innate strength by weaving this spell.''");
quest::summonitem("30977"); }

if($itemcount{30965} == 1){
quest::say("Nicely done $name. This anchor should be sufficient to keep Siver bound to this realm for a while. She is strong enough to blind your enemies with a bright flash of light now, all you have to do is call on her spirit. I still cannot make complete sense of her thoughts. I think she is trying to tell me of another whisperling entrapped within the crater. Keep an eye open for the whisperling Scorpialis.");
quest::say("In the meantime, you can seek out a shield made of Xakra. Xakra made of the ethereal fabric of the spirit realm. I know the Shak Dratha within the thicket are weavers of this rare form of shadow silk. Such a shield can help us strengthen the anchor, making it easier for Siver to aid you. It will also improve her health greatly. She has been through a lot and is in rather poor condition as it stands now.");
quest::summonitem("15021","1"); }

plugin::return_items(\%itemcount);

}

#End of FILE Zone:sharvahl  ID:155198 -- Spiritist_Ragnar 

