# items: 80044, 80038
sub EVENT_SAY {
  $clientver = $client->GetClientVersion();
  if(quest::istaskactive(3539)) {
    if(quest::istaskactivityactive(3539, 0)) {
      if($text=~/costume/i) {
        quest::emote("helps you into an itchy scarecrow costume, 'Good luck, if you get hit with any pies, come back and I'll help you get get cleaned up and [try] again.'");
        quest::playerrace(82);
        quest::updatetaskactivity(3539, 0);
      }
    }
    elsif(quest::istaskactivityactive(3539, 2)) {
      if($text=~/hail/i) {
        if(!defined($qglobals{halloween_pies})) {
          quest::emote("claps in amusement, 'Bravo $name, you've done very well and managed to dodge every pie thrown at you, quite remarkable. Why don't you relax and enjoy some of these fresh baked pies I've just made.'");
          quest::summonitem(80044, 10); # Item: Tasty Squash Pie
          $client->AddLevelBasedExp(10, 0);
          quest::setglobal("halloween_pies", 1, 0, "D30");
          quest::updatetaskactivity(3539, 2);
        }
        else {
          quest::emote("claps in amusement, 'Bravo $name, you've done very well and managed to dodge every pie thrown at you, quite remarkable. Why don't you relax and enjoy some of these fresh baked pies I've just made.'");
          quest::updatetaskactivity(3539, 2);
        }
      }
    }
    else {
      quest::say("Good luck, if you get hit with any pies, come back and I'll help you get get cleaned up and [try] again.");
    }
  }
  if($clientver > 2){
    if(!quest::istaskactive(3539)) {
      if($text=~/hail/i) {
        quest::emote("smiles graciously at you, 'Have you come to participate in our pie flinging [tradition]?'");
      }
      if($text=~/tradition/i) {
        quest::emote("nods understandingly, 'I see you are not familiar with this particular tradition... It began long ago when an Erudite wife grew tired with her lazy, loafing [husband].'");
      }
      if($text=~/husband/i) {
        quest::emote("chuckles politely, 'Oh yes, this Erudite fellow wouldn't lift a finger to help anyone, let alone his loving wife... poor woman, worked her fingers to the bone for him day in and day out. Well, good things only last so [long].'");
      }
      if($text=~/long/i) {
        quest::emote("shifts her stance slightly, 'Having just baked a fresh pair of squash pies, this hard working wife suddenly snapped as she looked down at her napping husband, and [hurled] both pies down at him, scolding him angrily as he tried to understand what had just happened to him.'");
      }
      if($text=~/hurled/i) {
        quest::emote("laughs, 'Well, I guess there isn't much more to the story, but somehow it has evolved into a wonderful tradition that takes place in the forest of Toxxulia each year... Participants don scarecrow costumes, and fling freshly baked pies at each other... I have some freshly baked pies, if you would like to [take part].'");
      }
      if($text=~/take part/i) {
        quest::emote("hands you a stack of warm squash pies, 'You will also need to put on a [costume] when you are ready to start flinging pies.'");
        quest::assigntask(500219);
        quest::assigntask(3539);
        quest::summonitem(80038, 999); # Item: Stack of Squash Pies
      }
      if($text=~/try/i) {
        quest::say("Good luck, if you get hit with any pies, come back and I'll help you get get cleaned up and [try] again.");
        quest::assigntask(500219);
        quest::assigntask(3539);
        quest::playerrace(82);
        quest::updatetaskactivity(3539, 0);
        quest::summonitem(80038, 999); # Item: Stack of Squash Pies
      }
    }
  }
  else {
    $client->Message(15, "This task does not support the Titanium client or lower. Please upgrade to SoF or newer.");
  }
}