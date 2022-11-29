

sub EVENT_SAY {

  my $anchorID = 500000;
  
  my $charKey = $client->CharacterID() . "-TL";
  
  if ($text=~/hail/i) {
    if (quest::get_data($charKey . "-RecievedInitialSoulAnchor")) {
      if (plugin::check_hasitem($client, $anchorID)) {
        plugin::NPCTell("Welcome back, $name. I trust that your adventures are fruitful. When you are stronger, I will have work for you. Return to me then.");
      } else {
        plugin::NPCTell("Greetings, $name. It looks as though you've lost your ". quest::varlink($anchorID) ."]. Would you like me to [". quest::saylink("replace it",1) ."]?");
      }
    } else {
      plugin::NPCTell("Hail, traveler. You've arrived at the [". quest::saylink("Nexus of the Spires",1) ."], where your journey begins.");    
    }
    POPUP_DISPLAY();
  } elsif ($text=~/Nexus of the Spires/i) {
    plugin::NPCTell("This complex serves as both a target and a projector for a vast teleportation network spanning Norrath and beyond. Many adventurers find their way here, looking to [". quest::saylink("expedite their travels",1) ."].");
  } elsif ($text=~/expedite their travels/i) {
    plugin::NPCTell("I can grant you access to our network, $name - but only if you are willing to do me a favor. We are studying a method of using aura resonance to ... I'll spare you the technical details. 
                     The shorter version is that our Magi can channel these spires to transport you to their complementary structures in other locations. In order to transport you to other locations, you will 
                     need to first [". quest::saylink("attune your soul essence",1) ."] to those regions.");
  } elsif (($text=~/attune your soul essence/i or $text=~/replace it/i) and not plugin::check_hasitem($client, $anchorID)) {
    plugin::NPCTell("Here. Take this [". quest::varlink($anchorID) ."]. Carry this on your person at all times. If you encounter an [". quest::saylink("attunement nexus",1) ."], 
                     it will record the signature and allow us to return you to that location from here in the future.");
    $client->SummonItem($anchorID, -1, 0, 0, 0, 0, 0, 0, 21);
    quest::set_data($charKey . "-RecievedInitialSoulAnchor",1);
  } elsif ($text=~/attunement nexus/i) {
    plugin::NPCTell("Attunement nexus are locations where the magical energies are both balanced and unique enough that the spire array can target them. The anchor will faciliate your soul to absorb a portion of those ambient energies,
                     further grow in power.");
  }
}

sub POPUP_DISPLAY {
    my $Center = plugin::PWAutoCenter(22, 2);
    my $Break = plugin::PWBreak();
    
    quest::popup('', "$Center Welcome to The Heroes\' Journey!                      
                      <br>$Break<br>
                      <c \"#FF0000\">The Rules:</c>
                      <br>
                      1. Don't be a dick. (Don't be unnecessarily rude or vulgar in global channels. Don't go out of your way to make other players have a bad time.)<br>
                      2. MQ2 is not allowed. The server files include several MQ2 features, with potentially more to come.<br>
                      <br>$Break<br>
                      THJ is a solo-balanced progression server, meant to offer a challenging experience for adventurers willing to develop both their character and their personal skills.
                      <br>
                      Progression does not exactly map to original expansion releases, but focuses more on level and overall difficulty. Currently, progression through ROUGHLY <c \"#00FFFF\">Scars of Velious</c> is available, though several Luclin zones are available and Veeshan's Peak and the Classic planes are not. This is <c \"#00FFFF\">Tier 1</c>, and levels are capped at <c \"#00FFFF\">60</c>. Additional progression tiers will be added in the future.
                      <br>$Break<br>              
                      <c \"#DFA801\">This server uses several custom mechanics:</c><br>
                      <br>
                      1. 
                      ");
}
