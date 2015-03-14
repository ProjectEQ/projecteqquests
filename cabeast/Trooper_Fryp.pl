sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, citizen! Have you been fishing lately? The water is alive with sewer catfish. Unfortunately, there are also the barracudas!");
  }
  if ($text=~/sign the restraining order/i) {
    quest::say("Alas. The masters have learned of my long evenings in the tavern. Ok... Long mornings and afternoons too. Heh heh. Can't fight authority! Hand me the... Wait. I do not have my quill with me. Go and fetch me a writing quill and hand it to me along with the legion order and then I shall sign it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18241 => 1, 13051 => 1)) { #Legion Order (1 signed), Quill
    quest::emote("signs the order and hands it back to you. 'Well... At least I now have this fancy writing quill.'");
    quest::summonitem(18242); #Legion Order (2 signed)
    quest::exp(500);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabeast  ID:5104 -- Trooper_Fryp