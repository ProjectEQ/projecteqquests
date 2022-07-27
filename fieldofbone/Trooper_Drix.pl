# items: 48006, 48014, 48012, 48008
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Can't you see I am busy on patrol!");
  }
  if ($text=~/calling/i) {
    quest::say("I am the leading authority on restoring and deciphering hidden messages. I can probably make out the message if you can bring me back some [items] I commonly use.");
  }
  if ($text=~/what items/i) {
    quest::say("I will need your message, a frost crystal, a sarnak war braid, and some silver oxide. Bring these items back to me and be quick about it.");
    quest::summonitem(48006); # Item: Illegible Message
    quest::summonitem(48014); # Item: Geot's Pack
  }
  }
  
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 48006 =>1 )) {
    quest::say("Ah, I see you know my true [calling].");
  }
  if (plugin::check_handin(\%itemcount, 48012 =>1 )) {
    quest::say("Let me see now.");
    quest::emote("Trooper Drix uses the mixture you brought him and spreads it evenly across your document. It settles into all the wrinkles and with the speed of a Master, Trooper Drix uses the sarnak braid to seal the pieces as one.");
    quest::summonitem(48008); # Item: Sealed Message
    quest::say("Take this sealed note back to whoever you need to. I dare not say what it reads out loud.");
  }
  plugin::return_items(\%itemcount);
}

