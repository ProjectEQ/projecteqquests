# items: 6310, 30050, 30049, 30052
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Lo outlander. Grizlin weaponsmaker for tribe. Make mighty blade from bone. Very important now.. need make many spear for hunter. Not make spear, then hunter not bring meat. Now my friend Keref sad, his pack gone north and Keref alone. Want to find way to help Keref but must make weapon for tribe. Maybe you go find what Keref need to make happy?");
  }
  elsif ($text=~/harpoon/i) {
    quest::say("Ahh, Harpoon hard to make. Grizlin need many thing to make true harpoon. Will need strong staff, strong bone, strong rope.");
  }
  elsif ($text=~/strong staff/i) {
    quest::say("Good staff always properly carved with totem and rune. Strong and mighty, very good for harpoon making. Not make in many moons here. All wood kept for fire. Perhaps find among outland gnoll tribe where wood is plentiful");
  }
  elsif ($text=~/bone/i) {
    quest::say("Mightiest bone come from whale. Very strong, very powerful. Yes, bone of mighty whale make very strong blade. Good for harpoon.");
  }
  elsif ($text=~/strong rope/i) {
    quest::say("Not know where find strong rope. For mighty harpoon, need very strong bone or harpoon break rope too much. Maybe furless ones with steel canoe have mighty rope.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6310 => 1, 30050 => 1, 30049 => 1)) {
    quest::say("Yes, these good.");
    quest::emote("forges the items into a finely crafted harpoon. Grizlin holds the weapon up and inspects it for a moment.");
    quest::say("Yes, this fine weapon. This hero weapon! Groumshak have harpoon much like this. May it bring much food for your pack, furless one.");
    quest::emote("hands you the harpoon with a nod of his head.");
    quest::summonitem(30052); # Item: Rune Shafted Harpoon
    quest::faction(439, 30); # Faction: Snowfang Gnolls
    quest::faction(431, -30); # Faction: Ulthork
    quest::exp(1000);
  }
}

# Quest by mystic414
