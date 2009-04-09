#all texts made up


sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Who are you?! Why are you on MY island?! If you have [business] with me then speak! Otherwise, leave at once.");
  }
  if ($text=~/business/i) {
    quest::say("I'll only deal with a wizard! And you look like no real [wizard] I've ever met!");
  }
  if ($text=~/wizard/i) {
    quest::say("Your a wizard you say? Hrmph! If so, let's see you prove it to me. I need some item's collected for my research. In return, I will give you some [armor] I have laying around.");
  }
  if ($text=~/armor/i) {
    quest::say("I have a [bracer], [cap], [pants], [robe], [sandals], [shawl], and [sleeves]. I gave some of the other ones to Trizpo if you desire those as well, oh great 'wizard'");
    quest::emote("laughs extremely loud");
  }
  if ($text=~/bracer/i) { #bracer
    quest::say("For the bracer bring me a Cloud Jewel, Mark of Potency and a Book of Applied Magic.");
  }
  if ($text=~/cap/i) { #cap
    quest::say("For the cap bring me a Meteor Jewel, Mark of Explosion, Explosive Dust and a Book of Wizardry.");
  }
  if ($text=~/pants/i) { #pants
    quest::say("For the Pants bring me a Moon Jewel, Gilded Branch, Fiery Sand and Mark of Energy. ");
  }
  if ($text=~/robe/i) { #robe
    quest::say("A great robe if you bring me an astral jewel, Mark of Sorcery, Book of Sorcery and Globe of Power.");
  }
  if ($text=~/sandals/i) { #sandals
    quest::say("I can give you a beautiful pair of sandals for a sky jewel, Mark of Intensity, and Sun Stained Steel Rod.");
  }
  if ($text=~/shawl/i) { #shawl
    quest::say("For the shawl bring me a Star Jewel, Mark of Force, and Tro Jeg Toes.");
  }
  if ($text=~/sleeves/i) { #sleeves
    quest::say("For the sleeves bring me a Sun Jewel, Mark of Implosion, Grub Worm Guts and a Fiery Heart.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4724 => 1, 4491 => 1, 4723 => 1)) { #bracer
    quest::summonitem(3715);
    quest::say("This doesn't in any way make you a real wizard. Merely an apprentice.");
    quest::exp(50000);
  }
  if (plugin::check_handin(\%itemcount, 4711 => 1, 4709 => 1, 4710 => 1, 4493 => 1)) { #cap
    quest::summonitem(3710);
  }
  if (plugin::check_handin(\%itemcount, 4720 => 1, 4719 => 1, 4718 => 1, 4489 => 1)) { #pants
    quest::summonitem(3713);
  }
  if (plugin::check_handin(\%itemcount, 4494 => 1, 4713 => 1, 4714 => 1, 4712 => 1)) { #robe
    quest::summonitem(3711);
  }
  if (plugin::check_handin(\%itemcount, 4725 => 1, 4492 => 1, 4726 => 1)) { #sandals
    quest::summonitem(3716);
  }
  if (plugin::check_handin(\%itemcount, 4721 => 1, 4490 => 1, 4722 => 1)) { #shawl
    quest::summonitem(3714);
  }
  if (plugin::check_handin(\%itemcount, 4717 => 1, 4716 => 1, 4715 => 1, 4488 => 1)) { #sleeves
    quest::summonitem(3712);
  }
}
