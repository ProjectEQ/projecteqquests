# Fusibility Research

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings. I am Makil Rargon, an esteemed assistant to the great wizard [Al'Kabor]. What can I help you with?");
  }
  if ($text=~/al'kabor/i) {
    quest::say("Al'Kabor is the most powerful wizard on all of Norrath. He is currently back to his Combine Empire research. Being his most trusted assistant, he assigned me to follow up on his fusibility [research] findings. Do you have any information to offer?");
  }
  if ($text=~/research/i) {
    quest::say("Ah. Yes, his fusibility research. Al'Kabor has been studying the melting point of minerals. Here, take this journal. It explains what fusibility is. Over the last few years, he has conducted several tests on [fusible ores].");
    quest::summonitem(18290);
  }
  if ($text=~/fusible ores/i) {
    quest::say("An ore is considered fusible if it can be melted. Now, this book explains the most unique forms of fusible ore that the master has conducted [experiments] on.");
    quest::summonitem(18293);
  }
  if ($text=~/experiments/i) {
    quest::say("So far his research has been quite successful. This journal explains what he has been able to accomplish. He has managed to create several magical items including an artifactual scepter of great power. While only he can grant permission to a worthy wizard to possess the artifact, if you are willing to help me complete a [fusibility test], I can offer you another item of great strength against the elements.");
    quest::summonitem(18294);
  }
  if ($text=~/fusibility test/i) {
    quest::say("Very well then . . . Fill this Empty Fusible Ore Crate up with four different fusible ores then seal it. Bring me back the Full Crate of Fusible Ore and I will use the compound to create a magical item that was developed by Master Al'Kabor.");
    quest::summonitem(17408);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 24069 => 1)) {
    quest::say("Well done, $name. Here is your reward."); #generic text
    quest::exp(500000);
    quest::summonitem(24070);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: westwastes ID: 120079 NPC: Makil_Rargon