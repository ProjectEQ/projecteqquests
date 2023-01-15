# name: General V`Ghera
# level: 65
# class: Shadowknight
# race: Dark Elf
# gender: Male
#
#
#
#
# Turn in Stanos' head for the Guise of the Coercer
# items: 28058, 2475


sub EVENT_SAY {
  if ($text=~/Stanos/i) {
    quest::say("Stanos? Stanos!! That dog, I WILL see him dead for what he cost me. Outcast I am, stripped of my position, my god has forsaken me, blaming ME for the loss of some tome. And you, $name, you have aided him. For that, you will die first. Please, struggle and beg, I do so enjoy watching my victims squirm, and I have little joy left in my life now. If you want my favor, perhaps if you came bearing Stanos' head I would be more forgiving. But I doubt it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28058 => 1)) {
    quest::say("Life is indeed sweet! Thank you, $name, you have done me a great service this day. Take this, Stanos was kind enough to return it to me, and I have no use for it now. Know that you have the blessing of Innoruuk for this deed! But of course, I leave it to you to leave here alive. A leader has to feed his minions, you know.");
    quest::summonitem(2475); # Item: Guise of the Coercer
    quest::exp(500000);
    quest::ding();
    quest::faction(420,20); # Faction: Fallen of Bloody Kithicor
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}

#Originally submitted by ShadowBlade, corrected turn-in text by Jim Mills
