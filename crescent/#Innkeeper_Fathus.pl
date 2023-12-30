sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Vasha, $name, and welcome to my little corner of our fine city of Crescent Reach. I have a fine selection of goods available and even the [" . quest::saylink("council") . "] has been known to frequent my establishment, I'm proud to say!");
  }
  if ($text=~/council/i) {
    quest::say("Oh yes indeed! I'm always honored when one of the representatives of our great dragon progenitors graces my humble shop. Would you like to [" . quest::saylink("learn more") . "] about the council of the city called, the Scions of the Six, $name?");
  }
  if ($text=~/learn more/i) {
    if (!quest::istaskcomplete(6802)) {
      quest::say("Ah $name, you are wise indeed. Take this note to Council Aide Mystrana to be introduced to the Scions of the Six. You are embarking on a fantastic journey of discovery!");
      quest::summonitem(85088); #Crescent Citizen's Declaration
      quest::taskselector(6802); #Getting to Know You: The Council's Aid
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}