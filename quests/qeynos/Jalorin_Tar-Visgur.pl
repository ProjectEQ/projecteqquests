sub EVENT_SAY {
  if ($text=~/sent from erudin/i) {
    quest::say("Well what is it you have been sent for? Go ahead I don't have all day I must get these [incantations] to the council and I am not finished with them yet.");
  }
  if ($text=~/incantations/i) {
    quest::say("You certainly do not look like you could read the scrolls I have been working on so I am wondering why you are questioning what they are. I am waiting for some scrolls from my friend Elisi. The last time I saw her she gave me this [parchment] but I am waiting for her to complete it, would you be able to [return] it to Brianna for me? It is quite clear that she trusts you so I suppose I should as well.");
  }
  if ($text=~/return/i) {
    quest::say("Very well here you are. If we are done here please excuse me for I have much work to do.");
    quest::summonitem(21699);
  }
  if ($text=~/forget about Elisi/i) {
    quest::say("You know, Elisi was a bit like you she didn't know when to quit. You and her will soon share the [same fate] I should think.");
  }
  if ($text=~/same fate/i) {
    quest::say("DIE!");
    $Mob->AddToHateList($client, 1)
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 21971 => 1)) {
    quest::say("Ah erm. Yes of course. You have been sent by Erudin am I right?");
  }
  if (plugin::check_handin(\%itemcount, 21969 => 1)) {
    quest::say("Brianna must think I am stupid to trust a complete stranger with the most powerful spells I have ever collaborated on with Elisi. I will not give you the parchments that she asks for, but I will give you a fair warning to stay out of my business. If you do not leave me be and [forget about Elisi], I will grow quite angry.");
  }
  plugin::return_items(\%itemcount);
}
