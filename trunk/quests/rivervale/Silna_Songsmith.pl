## QuestUpdater.exe
my $Freeport = quest::saylink("deliver to freeport", 0, "Freeport");
my $deliver = quest::saylink("deliver to freeport", 0, "deliver");
my $mail = quest::saylink("what mail", 0, "mail");
my $interested = quest::saylink("I am interested", 0, "interested");
#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
#Items Involved: Bardic letters: 18150-18167
#################

sub EVENT_SAY { 
if($text=~/Hail/i){
plugin::Whisper("Hail, $name - Are you $interested in helping the League of Antonican Bards by delivering some $mail?");
}

if($text=~/what mail/i){
plugin::Whisper("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more central offices.  Are you $interested?");
}

if($text=~/I am interested/i){
plugin::Whisper("I have messages that need to go to - well, right now I have one that needs to go to Freeport.  Will you $deliver mail to $Freeport for me?");
}

if($text=~/deliver to freeport/i){
plugin::Whisper("Take this pouch of mail to Ton Twostring. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
quest::summonitem("18164");
}

}
#END of FILE Zone:rivervale