sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Rrrribit.. Please, let me go!! I don't want to be eaten!!");
  }
  if ($text=~/glib sent me/i) {
    quest::say("Liessss. ...Groakk.. I do not believe you!! Bring me proof. Bring me the necklace of a basher!! ..Groakk..");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13311 => 1)) {
    quest::say("Groak.. So you are a friend to the froglok. ..Grooakk.. I am soon to die. My precious legs are a delicacy here. Before I go I must contact my brother Grikk. He is a froglok forager in Innothule. Give him this vial. He will know what it means");
    quest::summonitem(13375);
    quest::exp(500);
  }
  elsif (plugin::check_handin(\%itemcount, 13376 => 1)) {
    quest::say("Grooak.. You have done much to help me. This will come in handy soon. Thank you. Here is Marda's information. Take it to her. They must know. Farewell.");
    quest::summonitem(18884);
  }
  else {
    quest::say("Groak.. I do not want this.");
    plugin::return_items(\%itemcount);
  }
}