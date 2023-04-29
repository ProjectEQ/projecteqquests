my $player = 0;

sub EVENT_SAY {
  $player = $userid;
  if (($text=~/hail/i) && !quest::istaskactive(505744)) {
    quest::say("Hello, friend. My name's Arias and it's lucky for you I'm good at binding wounds. You almost didn't make it. You can thank me later. For now, let's join forces and [escape] this dungeon.");
    $client->Popup2("Speaking with Arias", "<br>Arias responded to your hail in the <c \"#00A000\">Main Chat Window</c>.<br><br>Notice that the word [<c \"#00F0F0\">escape</c>] is highlighted blue and set apart in brackets. This indicates a key word or phrase that you can use to reply to Arias.<br><br>To respond, <c \"#00F0F0\">left click</c> on the word [<c \"#00F0F0\">escape</c>] in the <c \"#00A000\">Main Chat Window</c>.<br><br><c \"#F07F00\">Tell Arias 'I want to escape.' to continue.</c>", 6);
  }
  if (($text=~/escape/i) && !quest::istaskactive(505744)) {
    quest::taskselector(505744); #Jail Break!
    quest::say("Glad you're with me! I've picked the flimsy cell door lock with a chisel I stole from the mines. That's one obstacle out of the way. Here's what we have left to do...");
    $client->Popup2("Quests", "<br>You have been offered your first quest: Jail Break! The <c \"#00A000\">Task Window</c> displays a verbose list of all the steps associated with this quest.<br><br><c \"#F0F000\">Remember:</c><br>You can press <c \"#00F0F0\">[ALT + Q]</c> to open the <c \"#00A000\">Quest Journal Window</c> and examine your quests' details.<br><br><c \"#F07F00\">Press 'Accept' when you are ready to begin Arias's quest.</c>", 7);
  }
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::say("Relax for a moment. I just set your ribs back into place. After the beating you got from those kobolds, you're lucky to be alive!");
  }
  if ($signal == 2) {
    quest::say("You still look a little dazed, my friend. Why don't you take a moment to get your bearings?");
  }
  if ($signal == 3) {
    $npc->SetFollowID($player);
    quest::say("Okay, I'm following you. Together we should be able to bring down the Gloomingdeep Jailor.");
  }
  if ($signal == 4) {
    quest::say("There he is! Lead the charge and we'll take him together.");
  }
  if ($signal == 5) {
    quest::attacknpctype(188001); ##The_Gloomingdeep_Jailor
  }
  if ($signal == 6) {
    quest::say("How's that for a little payback? The fight probably took a little bit out of ya'. Grab a seat and rest up. We'll need all our strength if we're going to get out of here with our limbs intact.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52303 => 1)) { #The Gloomingdeep Jailor's Key
    quest::say("Shhh... Do you hear that commotion? It sounds like a slave revolt has broken out in the mines. That explains why we were left alone here with the jailor. Hurry, let's join the rest of the slaves!");
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}
