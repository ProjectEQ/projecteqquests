sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("May I help you?"); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 3673 =>1, 3674 =>1 )) {
    quest::emote("turns to you and squints at the claws that you've just given him.");
    quest::say("'I see that you've been getting some use out of these things. They are crude, but they seem sturdy enough.");
    quest::emote("says as he returns the claws. He hands you a small bag and continues");
    quest::say("I hope the combat you've seen has made an impression on you, young friend. Combat is not pleasant, but it is often unavoidable. We are explorers and conflict often breeds in the unknown. Learn from each encounter and you are less likely to be trapped by conflict in the future.");
    quest::summonitem(3673);
    quest::summonitem(3674);
    quest::summonitem(17113);
    quest::say("In preparation for your journey down the path of Khati Sha, you will need to seek out the wolves of the moor. You will need to learn the behavior and abilities of this enemy. Once you have tracked and met these beasts, I will teach you how to best dispose of them in the future. Place two molars from the mouth of one of their pups in that bag and return to me. That will guarantee that you've come face to face with your foe.");
    }
if (plugin::check_handin(\%itemcount, 6182 =>1 )) {
  quest::say("Excellent, the spirits have returned you to me with your tail intact! The foe that you encountered was a young creature. Their elders are much less likely to allow your passage. The packs of wolves that roam the moor have proven to be quite a problem for our scouts. I will assist you in learning a method that will allow you to build and assist others in building a weapon that bites at the very spirit of those beasts. Take these claw mounts and use them in conjunction with the tomes that Qua sells. You'll need stretching dowels to treat the lashings. Jhimis usually keeps them behind the counter of his shop. Get a set from him and read through those tomes. Return to me with your new claws and your apprentice's cloak when you have completed the task.");
  quest::faction(423,3);
  quest::exp(10000);
  quest::summonitem(6145);
}
if (plugin::check_handin(\%itemcount, 5580 =>1, 6185 =>1, 6186 =>1 )) {
  quest::say("These claws are very well crafted! Your work is very impressive. Please take them to Ahom Guzhin. He is an old friend of mine. The sonic wolf claws were the result of some of his original studies in the moor. He has dedicated his life to studying creatures of the moor and can almost always be found there. Be careful when you go looking for him. You've done well here, but don't get careless. Good journeys.");
  quest::summonitem(6184);
  quest::summonitem(6185);
  quest::summonitem(6186);
  quest::faction(423,5);
  quest::exp(50000);
}
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155056 -- Kaam_Rahiir 

