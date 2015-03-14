sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings. I am a very busy person, is there something you would like [to do for me]? If not then take your leave, the work never ends around here now that the Trolls have moved in.");
  }
  if ($text=~/What can I do for you?/i) {
    quest::say("I have been coordinating those who [seek riches] to travel to Broken Skull Rock and seek some revenge for these Trolls. Do not worry, they won't be here long. We already have intelligence working against the Guktan forces to force them back into the swamps. It is intolerable that our allies be treated in such a manner. However, as you can well see, for now they are here. Their numbers have been greatly reduced and anger abounds. Having people bring back some evidence that the Broken Skull Clan suffers losses as well is good for morale, and we do pay for it; anything to keep them from exploding within our city walls.");
  }
  if ($text=~/I seek riches/i) {
    quest::say("You and many others. Do understand that we cannot offer you any aid once you leave the city. Your survival is your own responsibility. I will only reward you for bringing me servicable trophies. By this I mean, their heads. I will not accept an arm, or a finger, or any other body part that may have been taken without death. Do you [understand]?");
  }
  if ($text=~/I understand/i) {
    quest::say("Good then. Travel to Broken Skull Rock and slay the troll pirates. You will find that the ranks of Broken Skull are varied and nearly every rave may be represented, however as Trolls themselves, the Troll heads are the most useful, and therefore the only I shall accept. Bring me three of these heads in this and you shall have your reward.");
    quest::summonitem(17171);
  }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 54021 => 1)) {
   quest::emote("opens the bag and carefully removes three rather battered Troll heads.");
   quest::say("A bit beat up, but no true damage. You have done precisely as I have requested. Take this then, and be on your way.");
   quest::summonitem(54023);
   quest::exp(1000);
 } 
}