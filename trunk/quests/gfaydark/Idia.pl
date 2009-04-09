#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
#Items Involved: Bardic letters: 18150-18167
#################

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
}

if($text=~/am interested/i){
quest::say("I have messages that need to go to - well. right now I have one that needs to go to Freeport.  Will you [deliver] mail to [Freeport] for me?");
}

if($text=~/What mail/i){
quest::say("The League of Antonican Bards has a courier system made up of travelers, adventurers, and [agents].  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
}

if($text=~/agents/i){
quest::say("Lyra Lyrestringer, Tacar Tissleplay, Kilam Oresinger and Siltria Marwind all report to Jakum Webdancer.");
}

if($text=~/deliver to freeport/i){
quest::say("Take this pouch of mail to Ton Twostring. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
quest::summonitem("18166");

}
}

sub EVENT_ITEM { 

if (plugin::check_handin(\%itemcount, 18167 => 1)) {
    quest::say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
    quest::givecash(0,0,quest::ChooseRandom(8,9,10,11,12),0);
    quest::exp(100);
    quest::faction(192,10); #league of antonican bards
    quest::faction(184,10); #knights of truth
    quest::faction(135,10); #guards of qeynos
    quest::faction(273,-30); #ring of scale
    quest::faction(207,-30); #mayong mistmoore
  }

else {
    quest::say("I have no need for that.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:gfaydark