# Draconic Fellowship Instruments
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Good day, night, or whatever the time is. I am Mercutius Del Torre, minstrel of the Draconic Loyalist Fellowship. The great crystalline dragon goddess, Veeshan, has blessed my life with the opportunity to live among her children here in the Skyshrine. I have learned more of the dragons history, lore, and heritage than I ever could have dreamed of knowing back in my younger days in Qeynos. If you are privy to the musical arts and a friend of the dragons and kin I have developed a method of crafting [draconic instruments] and would craft some for you given I am provided with the necessary materials.");
  }
  if ($text=~/draconic instruments/i) {
    quest::say("I have a collection of instruments that I have crafted during my stay here in the Skyshrine from materials that can be found here on the continent of Velious. I presented my crafted instruments to the dragon scholars and they decorated them with runes in the ancient dragon script that enhances the magnificence of their sounds. I will craft either a [draconic drum], [draconic lute], or [draconic horn] if you bring me the materials in order to do so.");
  }
  if ($text=~/draconic horn/i) {
    quest::say("The horn must be crafted from the horn of a dragon, but you must not slay or participate in the slaying of a dragon to acquire this item.
The horn must be from a dragon of no prominent social status that died from natural causes. The old dragon horn must also be treated with a [special shellac] before it is returned to me. I will also require a black sapphire that will be cut into a mouthpiece for the horn. If you bring me those items I will craft the horn for you and have it inscribed with the dragon script runes.");
  }
  if ($text=~/draconic drum/i) {
    quest::say("The frame of the drum must be crafted from Kromrif Bones and the skin of the drum must be crafted from a [Cured Brontotherium Hide]. If you bring me those items I will craft the drum for you and have it inscribed with the dragon script runes.");
  }
  if ($text=~/draconic lute/i) {
    quest::say("The strings of the draconic lute must be crafted from Siren Hair and the body of the lute must be carved from a Brontotherium Femur treated with a [special shellac]. If you bring me those items I will craft the lute for you and have it inscribed with the dragon script runes.");
  }
  if ($text=~/cured brontotherium hide/i) {
    quest::say("First you must hunt down a brontotherium and skin its hide. Once you have the hide it needs to be cured with a [special tannin] in a tailoring kit.");
  }
  if ($text=~/special tannin/i) {
    quest::say("The tannin used to cure the brontotherium hide must be created by a brewer from a Flask of Water, an [Oily Goo Secretion], and one [Melted Glacier Whiskey].");
  }
  if ($text=~/oily goo secretion/i) {
    quest::say("In the caves of the Geonids in the Wakening Lands can be found Tar Goos. These Tar Goos secrete a sticky oily substance that makes an excellent preservative.");
  }
  if ($text=~/melted glacier whiskey/i) {
    quest::say("Melted Glacier Whiskey is a strong alcohol that can be purchased from the Coldain brewers of Thurgadin.");
  }
  if ($text=~/special shellac/i) {
    quest::say("The shellac used for the instruments must be created by a brewer from a Flask of Water, an [Oily Goo Secretion], and one [Kromrif Spit Vodka].
Once you have the shellac fire the old dragon horn or brontotherium femur in a kiln with the shellac.");
  }
  if ($text=~/kromrif spit vodka/i) {
    quest::say("Kromrif Spit Vodka is a strong alcohol that can be purchased from the Coldain brewers of Thurgadin.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 11655 => 1, 11654 => 1)) { #drum - kromrif bones, cured bronto hide
    quest::say("This will do nicely. Here take the drum I have already prepared and I will craft myself another drum from the materials you have collected.");
    quest::summonitem(12552);
  }
  elsif (plugin::check_handin(\%itemcount, 1834 => 1, 11657 => 1)) { #lute - siren hair, shellacked femur
    quest::say("This will do nicely. Here take the lute I have already prepared and I will craft myself another lute from the materials you have collected.");
    quest::summonitem(12553);
  }
  elsif (plugin::check_handin(\%itemcount, 10036 => 1, 11658 => 1)) { #horn - black sapphire, shellacked dragon horn
    quest::say("This will do nicely. Here take the horn I have already prepared and I will craft myself another horn from the materials you have collected.");
    quest::summonitem(12554);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::exp(50000);
  quest::faction(42,10); #cov
}

# EOF zone: skyshrine ID: 114278 NPC: Mercutius_Del_Torre


