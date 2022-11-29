

sub EVENT_SAY {
  POPUP_DISPLAY();
  my $charKey = $client->CharacterID() . "-MAO-Progress";
  my $progress = quest::get_data($charKey);
  if ($text=~/hail/i) {
    if ($progress <= 0) {
      plugin::NPCTell("Hail, ". $client->GetCleanName() .". You must be the latest bit of [".quest::saylink("mao1a",1,"dimensional flotsam")."] to wash up.");
    } else {
      plugin::NPCTell("Hail, ". $client->GetCleanName() .". Return to me when you've gained more experience. I will have work for you.");
    }
  } elsif ($text=~"mao1a") { #dimensional flotsam
    plugin::NPCTell("Apologies! Allow my to introduce myself; I am Magus Asorin, the head archaeologist of the Wayfarer's Brotherhood. This site is an ". 
                    "[".quest::saylink("mao1b",1,"ancient teleportation complex")."] built by the Combine prior to their decline. Unfortunately, it seems".
                    "to act as something of a magnet for dimensional travelers. Periodically a stranger such as yourself will turn up - no memory of from ".
                    "whence they came and [".quest::saylink("mao1c",1,"no clue how to return")."].");
  } elsif ($text=~"mao1b") { #ancient teleportation complex
    plugin::NPCTell("The Nexus was built long ago, and while it has fallen into disrepair as a teleportation hub, it has remained a center of commerce for the ".
                    "inhabitants of Luclin, with both The Bazaar and the City of Shadowhaven nearby.");
  } elsif ($text=~"mao1c") { #no clue how to return
    plugin::NPCTell("I know that this is probably quite the shock, and you are of course welcome to investigate your own origins, but ".
                    "[".quest::saylink("mao1d",1,"the Brotherhood")."] will be of little assistance. We have been unsuccessful with previous Travelers, and expect ".
                    "you to be no different. We can help you in making home for yourself in this world, however.");
  } elsif ($text=~"mao1d") { #the Brotherhood
    plugin::NPCTell("The Wayfarer's Brotherhood is an organization of Adventuers who have banded together to delve into the dangerous and forgotten secret places ".
                    "of Norrath and beyond. We recently were able to reactivate the Great Spires of Norrath, reconnecting the world to the moon Luclin, where you stand now. ".
                    "I've also heard rumors that our leader, Morden Rasp, has set out on an expedition to lost Taelosia. I will let the staff here know to allow you access ".
                    "to the [".quest::saylink("mao1e", 1, "teleportation network")."]. I suggest that you venture out and find a place for yourself in this world, and once ".
                    "you've gained some more experience, I'll have some work for you." );
  } elsif ($text=~"mao1e") { #teleportation network
    plugin::NPCTell("There are wizards of the brotherhood located near each of the minor spires within the Nexus complex, they can assist you with traveling to the ".
                    "continents to which they are attuned. Only the existing Combine spires will allow a blind transit, however. There are other sites with weak ".
                    "dimensional barriers to which you can personally be attuned, though - you'll simply need to reach them on your own first." );    
    quest::set_data($charKey, "1");
  }
}

sub POPUP_DISPLAY {
    my $Break = plugin::PWBreak();
    
    quest::popup('', "Welcome to <c \"#FF0000\">Pyrelight</c>!                      
                      <br>$Break<br>
                      <c \"#FF0000\">The Rules:</c>
                      <br>
                      1. Don't be a dick. (Don't be unnecessarily rude or vulgar in global channels. Don't go out of your way to make other players have a bad time.)<br>
                      2. MQ2 is not allowed. The server files include several MQ2 features, with potentially more to come.<br>
                      <br>$Break<br>
                      Pyrelight is a solo-balanced progression server, meant to offer a challenging experience for adventurers willing to develop both their character and their personal skills.
                      <br>
                      Progression does not exactly map to original expansion releases, but focuses more on level and overall difficulty. Currently, progression through ROUGHLY <c \"#00FFFF\">Scars of Velious</c> is available, though several Luclin zones are available and Veeshan's Peak and the Classic planes are not. This is <c \"#00FFFF\">Tier 1</c>, and levels are capped at <c \"#00FFFF\">60</c>. Additional progression tiers will be added in the future.
                      <br>$Break<br>              
                      <c \"#DFA801\">This server uses several custom mechanics:</c><br>
                      <br>
                      1. 
                      ");
}



      
      
      
      
      
      Welcome to the [". quest::saylink("mao1a",1,"Nexus of the Spires") ."], where your journey begins. ".
                      "I am Magus Asorin, archaeological leader for the Wayfarer's Brotherhood on Luclin. We have been studying this site for some time now, ".
                      " and have returned it to [". quest::saylink("mao1b",1,"operational status") ."].");
    }The Combine Empire built this complex in a past age, along with the corresponding [" quest::saylink("mao1c",1,"Great and Minor spires") .
                    "] scattered throughout Norrath. From time to time an adventurer like yourself will wind up here from origins unknown, "