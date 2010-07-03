sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(207,4)) { #Ambushed! Step 3
      quest::say("Before you got here I received a dispatch from Dellweena discussing the note she discovered. It all makes sense now, the seemingly random attacks...some objects being taken while others left untouched. I am a fool for I should have seen this earlier! But I assumed that none of my rivals had the audacity to attempt to undermine me. Nevertheless they have struck and now I must find out who is behind this and what exactly they are trying to accomplish. This note with the seal for my house will garner you a significant reward from your guildmaster.");
    }
    else {
      quest::say("'Greetings, $name,' Barrenzin smiles as he hands you a glass of wine. 'Thank you for coming on such short notice. Please make yourself comfortable and then we can discuss [business].'");
    }
  }
  if($text=~/business/i) {
    quest::say("'A $class that gets right to point,' Barrenzin smiles again. 'Such a refreshing change of pace from the pandering rabble I normally deal with. Allow me to be blunt then. I recently lost several, let's say, 'associates' of mine and I'm a little understaffed at the moment. I've been following your adventuring career since Gloomingdeep and I think you could go far in my [organization]. What say you? [Interested] in making a name for yourself? Or perhaps you have a [group] assembled that's looking for a little coin?'");
  }
  if($text=~/interested/i) {
    quest::say("Very well then. Here are the tasks I have for you right now. Be sure to report back to me as you gain field experience. As sure as the accursed sunrise, there's always more work to be done around here.");
    quest::taskselector(207);
  }
}

sub EVENT_ITEM {
  quest::say("I do not need this.");
  plugin::return_items(\%itemcount);
}