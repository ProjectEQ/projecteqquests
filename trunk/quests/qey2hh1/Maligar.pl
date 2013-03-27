# maligar and his enraged doppleganger
#

my $entid1;
my $mob1;
my $mobattack;

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20368 => 1)) {
    quest::say("Hmmm. What's this? A note from that silly bard Baenar? I wasn't aware that those of his kind could write, much less read.' Maligar lets out a deep laugh. 'I see you do not share my sense of humor. Let's read it, shall we? Oh, no! She's dead? I knew that already, you fool. It was by my hand she died! Ooops! Did I let that slip out? Silly me. I guess I will have to kill you now!");
    $entid1 = quest::spawn2(12173,0,0,-10909,1260,209,136);
    $mob1 = $entity_list->GetMobID($entid1);
    $mob1attack = $mob1->CastToNPC();
    $mob1attack->AddToHateList($client, 1);
    quest::attack($name);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: qey2hh1 ID: 12076 NPC: Maligar

