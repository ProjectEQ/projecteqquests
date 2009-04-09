sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("Inem R`ker shoots you an untrusting glare. He is wearing a pendant that resembles a sun occluded by the horizon. ");
  }
  if ($text=~/The sun is setting on the horizon/i) {
    quest::say("Yes, of course. I have been waiting for you, $name. Seek out the legendary rogues. While some of them may welcome you with open arms, the [Teir`dal] will certainly be the most difficult to negotiate with. Wear your pendant so that they recognize your status. While tales of your exploits and your name are well known, they don't necessarily know what you look like. You can use that to your advantage. When you can fit it into your schedule, there is also [another problem] that needs to be dealt with. I hope this hasn't overwhelmed you yet. There is much to be done and little time.");
  }
  if ($text=~/what Teir`dal/i) {
    quest::emote("Inem R`ker winks and you see through his guise. He isn't a dark elf after all");
    quest::say("Yes, the Teir`dal's information might be tricky. You see. . . they hold a bit of a grudge against Stanos ever since they learned of his involvement in the Joren incident. That grudge WILL carry over to you, no matter how charming you think you might be. Use other methods to obtain the information if you cannot coerce it from them.");
  }
  if ($text=~/another problem/i) {
    quest::say("I hope you aren't against a little intimidation, $name.' He sighs, 'This is the problem. Our most influential contact in the Wayfarer's Brotherhood refuses to affiliate himself with us, even a little, until the bad publicity surrounding our organization lightens up a bit. Our shady background wasn't a problem in the past, but now he refuses to speak with us. We suspect he has turned over a new leaf and now that he considers himself a champion of the people, he doesn't want to tarnish this reputation. If you can convince those that have spoken out against Stanos to [change their tune], I think we stand a chance of garnering the favor of this contact again. This job is of utmost importance, $name, because this contact could lead us to the would-be assassin.");
  }
  if ($text=~/change their tune/i) {
    quest::say("Yes, exactly. Bards. The self-proclaimed heralds of Norrath. What they are is slander, personified. It seems there are several of them that have been sullying Stanos' name in both story and song. Deliver this letter to them. It's a 'request' that they speak favorably about our generous benefactor, lest some ill fate befall them. If they refuse, you know what to do. Empty threats mean nothing.");
    quest::summonitem(9590);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10243 => 1)) {#Galdorin
    quest::say("Well done, $name. Galdorin had it coming, so don't feel too guilty about your part in this.");
    quest::summonitem(9590);
  }
  if (plugin::check_handin(\%itemcount, 52416 => 1, 10239 =>1)) {#marsingers
    quest::say("Well done, $name.  Only one more slanderous bard left to warn, and silence if necessary.");
    quest::summonitem(9590); 
  }
  if (plugin::check_handin(\%itemcount, 10246 => 1)) {#Lythe Songbird
    quest::say("That should do the trick. I think our contact will speak with you now. His name is Lirpin, and he is a paladin that works for the Wayfarer's Brotherhood. I hear he led an expedition into Kuua recently, but his current location is anyone's guess. Good Luck.");
    #set flag here
  }
}