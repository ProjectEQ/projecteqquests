sub EVENT_SAY {
  my $charKey = $client->CharacterID() . "-MAO-Progress";
  my $progress = quest::get_data($charKey);
  if ($text=~/hail/i) {     
      if ($progress <= 0) {
        plugin::NPCTell("Hail, ". $client->GetCleanName() .". You must be the latest bit of [".quest::saylink("mao1a",1,"dimensional flotsam")."] to wash up.");
      } else {
        plugin::NPCTell("Hail, ". $client->GetCleanName() .". Return to me when you've gained more experience. I will have work for you.");
      }
  } elsif ($text=~"mao1a") { #dimensional flotsam
    plugin::NPCTell("Apologies! Allow my to introduce myself; I am Eithan, the head archaeologist of the Wayfarer's Brotherhood. This site is an ". 
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
    
    my $acctMoneyFlagKey = $client->AccountID() . "-InitMoneyFlag";
    my $acctMoneyFlagValue = quest::get_data($acctMoneyFlagKey);
    if ($acctMoneyFlagValue <= 10 && $progress <= 0) {
      plugin::NPCTell("Also, take these coins. You'll need them to get started, and you can pay me back sometime if your pride demands it.");
      quest::givecash(0, 0, 0, 10);
      quest::set_data($acctMoneyFlagKey, ++$acctMoneyFlagValue);
    }
    
    quest::set_data($charKey, "1");
    quest::message(15,"You have gained the ability to use the Nexus teleportation network.");   
  }
}