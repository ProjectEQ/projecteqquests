#Zone: Plane of Sky

#Short Name: airplane

#Zone ID: 71

#

#NPC Name: Master of Elements

#NPC ID: 71040

#Quest Status: finished

#



sub EVENT_SPAWN {

  quest::settimer("depop",180); #this triggered mob is only available for three minutes then depops

}



sub EVENT_SAY {

  if ($text=~/hail/i) {

    quest::say("I... am... the... Master... of... Elements.. Elements... Forgive... me. I am... unaccustomed.. to.. speaking.. this.. mortal... tongue. Might.. you... be... the... One?");

  }

  if ($text=~/i am the one/i) {

    quest::say("Trilith... Magi'kot.. knelt.. before.. the.. orb.. in.. his.. his.. last.. few.. moments... of.. mortal.. life. He... too... believed.. that.. he.. had.. the.. power.. and.. balance.. needed.. to.. grasp... control.. of.. the.. elements. He.. was.... flawed. Coming.. to... me... is.. a.. matter.. of.. no.. small.. import. Only.. only... one.. who.. is.. of.. balance.. and.. power... power.. may.. control.. the.. Orb.. of... Mastery. Give.... give.. me.. the.. Elements.. you.. have... gathered.. and.. I.. shall.. see.. if.. you.. are.. ready.. ready.. to control.. the... Elements.. of... life.. life.. life.");

  }

}



sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 28032 => 1, 28009 => 1, 28006 => 1, 28033 => 1)) {

    quest::say("You... are.. balanced... and.. powerful.. for.. a.. mortal... $name ..... $name. More.. so.. than.... Magi'kot. But.... you.. are.. not.. yet.. ready.. to.. transcend.. transcend... this.. mortal.. coil. Take.. take.. seize.. this.. Orb... for.. you.. are.. worthy.. of.. reward.. and.. with... the.. aid.. of... the... balance.. balance.. contained.. within.. the.. Orb.. you.. may.. yet.. reach.. the... ultimate... Mastery.");

    quest::summonitem(19436);

    quest::depop();

    quest::stoptimer("depop");

  }

  else {

    plugin::return_items(\%itemcount);

  }  

}



sub EVENT_TIMER {

  quest::depop();

  quest::stoptimer("depop");

}



#END of FILE Zone: airplane ID:71040 -- Master_of_Elements



