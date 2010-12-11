#Ennixy_Frennor.pl
#Part of Innoruuk Regent

sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Unless you have something to tell me about yourself that I could possibly be interested in, be gone!");
  }
  if ($text=~/hate be my guide/i) {
    quest::say("So you work for Szorn eh? It's about time he sent someone to check up on me! The Koada'Dal in possession of the crate is on his way here right now to cut a deal with me. I have been trying to send word to Szorn for several days to send support as I do not plan on allowing the elf to leave these mountains alive. You have arrived just in time. Kill the elf and the crate is yours!");
    quest::unique_spawn(56150,0,0,-836,1385,-110,128); #Crusader Swiftmoon
  }
  if($text=~/wormwood/i) {
    quest::say("Wormwood? Why do you want that? OH nevermind. Here! Take it and leave me alone! You're wasting my valuable time!");
    quest::summonitem(10265); #Sprig of Wormwood
  }
}

sub EVENT_ITEM {
  quest::say("I don't need this."); #text made up
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:steamfont  ID:56099 -- Ennixy_Frennor