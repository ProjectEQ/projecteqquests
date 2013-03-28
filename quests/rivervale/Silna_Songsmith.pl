#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
#Items Involved: Bardic letters: 18150-18167
#################

sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hail, $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
  }

  if($text=~/mail/i) {
    quest::say("The League of Antonican Bards has a courier system made up of travelers and adventurers. We pay good gold to anyone who will take messages from bards such as myself to one of our more central offices. Are you [interested]?");
  }

  if($text=~/interested/i) {
    quest::say("I have messages that need to go to - well, right now I have one that needs to go to Freeport. Will you [deliver] mail to [Freeport] for me?");
  }

  if($text=~/deliver/i || $text=~/freeport/i){
    quest::say("Take this pouch of mail to Ton Twostring. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
    quest::summonitem(18164); #Pouch of Mail (Freeport)
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:rivervale NPC:Silna_Songsmith