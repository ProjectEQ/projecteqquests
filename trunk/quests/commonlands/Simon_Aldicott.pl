# final task in quest for the spell: divine might
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail and well met. I am Simon Aldicott, a cleric in the service of Mithaniel Marr. I've been sent here to prepare a funeral service for one of our lost to join Marr in his kingdom.");
  }
  if ($text=~/funeral service/i) {
    quest::say("Are you the brave knight whom Valeron sent to meet me here? If so please place the remains in the coffin and seal it. Then hand me the coffin so that we may bless it in the waters of this lake.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6708 => 1)) {
    quest::emote("places the coffin in the water and begins to pray. 'Lord of Valor high above, take this knight, your loyal child, into thy kingdom and all that is holy! What is that thing!'");
    quest::spawn2(21031,0,0,2901,259.7,-51,25); #a tortured revenant
  }
  elsif (plugin::check_handin(\%itemcount, 6709 => 1)) {
    quest::say("Thank you, Knight. With this task accomplished, I shall reward you with this scroll. It is an ancient spell that only the holiest of knights may cast. Remember your duty!");
    quest::summonitem(15693);
    quest::faction(258,100); #priests of marr
    quest::faction(105,-50); #freeport militia
    quest::faction(184,100); #knights of truth
    quest::exp(200000);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::say("Tis a sad thing. His soul was twisted to its current state somehow and he thought YOU were the foul Teir'Dal who destroyed him in the first place. But that is no matter..you have freed him to stand by Marrs side once more! Now, give me the ash so that I may finally put him to rest. In return for your valor I shall provide you with an ancient spell unknown to most Holy Knights of Marr.");
  }
}

# EOF zone: commons ID: 21011 npc: Simon_Aldicott

