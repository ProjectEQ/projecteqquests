# Quest for respecialization
# Quest for Bard Lambent Fire Opal
# items: 10128, 19049

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I am Ostorm of the Temple of Solusek Ro, guardian of the sacred crystal of Kintaz. Be wary and keep your distance, lest the proximity of the crystal [steal] your [memories].");
  }
  elsif ($text=~/steal my memories/i) {
    quest::say("It is the nature of the crystal of Kintaz to steal the memories of those around it. Only I am safe, and then only because of the strong wardings placed on me by Solusek Ro himself. Are you interested in [losing] any [memories]?");
  }
  elsif ($text=~/losing my memories/i) {
    quest::say("Recently, I have been experimenting with the crystal, and have found that those exposed to ruby light filtered through it tend to lose the memories of their most specialized arcane skills. Are you sure you want to [lose advanced memory] of specialization?");
  }
  elsif ($text=~/lose advanced memory/i) {
    quest::say("Be warned that once exposed to the crystal, I can not reverse the effects. If you desire exposure, fetch me a ruby.");
  }
  elsif ($text=~/fifty gold/i) {
    quest::say("You do not remember?  You promised me fifty gold coins for allowing you to be exposed to the sacred crystal of Kintaz.");
  }
}

sub EVENT_ITEM {
  if (quest::handin({10035 => 1})) { # Item: Ruby
    quest::say("..hear me? Ah, you seem to be coming out of your stupor. I think you have been exposed to the crystal long enough. By the time you leave the temple, your memories should have faded. Do you have the [fifty gold] coins that you owe me?");
    quest::faction(415,1); # Faction: Temple of Solusek Ro
    quest::faction(416,-1); # Faction: Shadowed Men
    foreach $skill (43, 44, 45, 46, 47) {
      if ($client->GetSkill($skill) > 49) {
        $client->SetSkill($skill, 49);
      }
    }
    quest::me("Your specialize skills have all been set to 49.");
    quest::exp(1000);
  }
  elsif (quest::handin({"gold" => 50})) { # Cash: Gold x 50
    quest::say("Thank you.");
    quest::faction(415,1); # Faction: Temple of Solusek Ro
    quest::faction(416,-1); # Faction: Shadowed Men
  }
  elsif (quest::handin({10031 => 2, 10000 => 1})) { # Items: Fire Opal x 2, Lambent Stone
    quest::say("Ahh, Genni must have sent you to me. Very well, here is your Lambent Fire Opal.");
    quest::summonitem(10128); # Item: Lambent Fire Opal
    quest::faction(415,1); # Faction: Temple of Solusek Ro
    quest::faction(416,-1); # Faction: Shadowed Men
  }
  elsif (quest::handin({16507 => 1})) { # Item: Enchanted Platinum Bar
    quest::say("I see that Gavel has sent you to me. Very well, I have magnetized your platinum bar - take it.");
    quest::summonitem(19049); # Item: Magnetized Platinum Bar
  }
}