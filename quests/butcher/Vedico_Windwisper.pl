###################################
#Zone: Butcherblock               #
#Short Name: butcher              #
#Zone ID: 68                      #
###################################
#NPC Name: Vedico Windwhisper     #
#NPC ID: 68115                    #
#Quest Status: finished           #
###################################

sub EVENT_SAY { 
  if ($text=~/Hail/i) {
    quest::say("Hello, $name. Have you seen the port master? I am here to complain about the shoddy service.");
  }
  if ($text=~/shoddy service/i) {
    quest::say("I was sailing from Freeport on one of the boats when a giant cyclops attacked the boat! No one lifted a finger as he stole the horn I was playing and ran off. Someone here has to answer for the loss of my horn.");
  }
  if ($text=~/giant cyclops/i) {
    quest::say("He was a huge cyclops! He came rushing up out of the water and stared at me with his big eye and said, 'Me like horn me take and play pretty music!' before he snatched my horn and disappeared back under the waves.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20530 => 1)) {
    quest::say("Where did you find this? I thought the cyclops took it. I am in your debt, $name. This horn has always been special to me.");
    quest::emote("reaches into her pack and pulls out a note. 'Do you think you could deliver this to my gnome friend Forpar? I have not spoken to him in a while and unfortunatly I will be unable to make the trip to visit him. If you are looking to have an instrument made he is the man to ask.'");
    quest::summonitem(20378);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:butcher  ID:68115 -- Vedico_Windwhisper

