sub EVENT_ENTERZONE {
  if (quest::istaskcompleted(138) == 0 && quest::istaskactive(138) == 0) { #Check if completed Task: New Beginnings
    quest::assigntask(138); #Force assign Task: New Beginnings
  }
}

sub EVENT_CLICKDOOR {
  if($doorid == 138) { #guild lobby
    if($client->CalculateDistance(1408, -377, -113) <= 30) {
      if(($client->GetClientVersionBit() & 4294967264)!= 0) {
        quest::MovePCInstance(344,5,18,-46,6,225);
      }
      else {  
        quest::movepc(344,18,-46,6,225);
      }
    }
  }
  if($doorid == 139) { #bazaar
    if($client->CalculateDistance(1452, 347, -113) <= 30) {
      quest::movepc(151,-425,0,-25,65);
    }
  }
}