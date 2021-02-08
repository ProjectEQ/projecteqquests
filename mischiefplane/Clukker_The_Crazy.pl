# Deck of Spontaneous Generation
#
# items: 13106, 17054

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Ha ha! Hello to you too! I have got this crazy deck that I'm willing to give to those [looking for a deck]. Ha ha! Oo!");
  }
  if ($text=~/looking for a deck/i) {
     quest::say("You're looking for a DECK? Ha ha ha! Well, bring me a fishing grub, tee hee, and I'll give you a nifty deck");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13106 => 1)) {
    quest::emote("takes a bite out of the fishing grub that was handed to him. Clukker then says, 'Ha ha HA! Thanks for the tasty treat! Now here is your deck! Hee hee haw!'");
    quest::summonitem(17054); # Item: Deck of Spontaneous Generation
  }
}

# EOF zone: mischiefplane ID: 126148 NPC: Clukker_The_Crazy

