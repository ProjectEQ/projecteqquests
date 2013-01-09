sub EVENT_CLICKDOOR {
  if($doorid == 2 || $doorid == 4 || $doorid == 40 || $doorid == 42) {
    if($uguild_id > 0) {
      if (defined($qglobals{"ginstance$uguild_id"})) {
        $guildinstance = $qglobals{"ginstance$uguild_id"};
        quest::AssignToInstance($guildinstance);
        quest::MovePCInstance(345, $guildinstance, -1.00, -1.00, 3.34);
      }
      else {
        $guildinstance = quest::CreateInstance("guildhall", 1, 86400);
        quest::AssignToInstance($guildinstance); 
        quest::setglobal("ginstance$uguild_id",$guildinstance,7,"H25");
        quest::MovePCInstance(345, $guildinstance, -1.00, -1.00, 3.34)
      }
    }
  }
  if(($doorid >= 5) && ($doorid <= 38))
  {
	$client->OpenLFGuildWindow();
  }
}