###############################################################
#  NPC:  Abigail
#  Zone:  Rathe Mtns
#  Quest:  Breastplate of Ro
###############################################################
# items: 12309, 12299

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings! I am the holder of the secret of the [Breastplate of Ro]. You may rest here. You are quite safe within this camp of paladins.");
  }
  elsif ($faction > 5) {
    quest::say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
  }
  elsif ($client->GetModCharacterFactionLevel(226) < 25) {
    quest::say("You need to prove your loyalty to my temple. Go to Felwithe and seek out the Clerics of Tunare. Prove to them your faith. Then ask the leader of this church if you are a [honored member].");
  }
  elsif ($text=~/breastplate of ro/i) {
    quest::say("The Breastplate of Ro mold will be awarded to you. First, you will perform a test of strength. Go to Faydwer. There you shall seek out and destroy the Teir'Dal who carry the dark cauldrons!! They have been venturing into our lands and capturing many Koada'Dal and Fier'Dal for cooking purposes! Bring to me two of their dark cauldrons.");
  }
}

sub EVENT_ITEM {
  if (($client->GetModCharacterFactionLevel(226) > 24) && plugin::check_handin(\%itemcount, 12309 => 2)) { # A Dark Cauldron
    quest::say("You have earned the mold. You will now need go and speak with Thomas about [Lord Searfire].");
    quest::summonitem(12299); # Mold of Ro Breastplate
    quest::faction(226, 20); # Clerics of Tunare
    quest::faction(279, 20); # King Tearis Thex
  }
  elsif (($client->GetModCharacterFactionLevel(226) > 24) && plugin::check_handin(\%itemcount, 12309 => 1)) {
    quest::say("I instructed you to return with no less than two dark pots.");
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:rathemtn  ID:50113 -- Abigail
