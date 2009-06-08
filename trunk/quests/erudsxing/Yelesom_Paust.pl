sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Ahh salutations young adventurer. I'd love to chat, but I have much studying to do. Farewell.");
  }
  if ($text=~/I will help you/i) {
    quest::say("Wonderful. The beast took my tool kit whilst I slept at camp. I awoke only to see him paddling frantically out into the ocean in a small boat. He couldn't have gone very far. If you stand at my [camp] and look towards the next closest head stone, you will be facing the direction in which the Kerran thief fled. Swim straight out from there and you should see his cunning little boat.");
  }
  if ($text=~/your camp/i) {
    quest::say("My camp is next to the head stone on the eastern most portion of this island. The Kerran may have dropped some of my tools inot the ocean as it fled. Please return the complete tool kit and I'll make sure my brother rewards you");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18173 => 1)) {
    quest::say("Gans sent you to check on me did he? Well you can tell my dear brother that the surveying has been halted. One of those furballs has stolen my tools, making my job impossible. Kerrans, kobolds, gnolls, we're constantly under siege by these primitives. Anyway, perhaps you could [help me]?");
  }
  elsif (plugin::check_handin(\%itemcount, 1768 => 1)) {
    quest::say("Thank you for recovering my tools, please take this to my brother for your reward.");
    quest::summonitem(1771);
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#EndFile: erudsxing\Yelesom_Paust.pl