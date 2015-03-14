#this quest needs to remain ID based because it only applies to this
#specific version of the mob, there are several with this name

# A skeleton Worker, Overthere
# This one is indiff to everyone, other ones around are RTA.
# give hime : spectacles, forsaken pariah mask, Evergreen Ivy Ringband, Green Death Rum
# Necro skull cap 5, returns A metal key, you have to give it to Tin Banker Assistant

sub EVENT_ITEM {
if ($itemcount{12848}==1){
      quest::emote('a skeleton worker stops working and begins to open his creaking jaw.');
      quest::say('I live to study and quench my thirst. I live to Bash the Faces of Pariah and entangle myself in the ivy of evergreen. I live. I want to remember.');
quest::summonitem(12848);
}
  if ($itemcount{12848}==1 && $itemcount{12850}==1 && $itemcount{12851}==1 && $itemcount{12610}==1) { 
    if ($ulevel>20) {
      quest::summonitem(12849);
    } else {
      quest::say('You will have to be more skilled to complete that quest.');
    }
  }
}
