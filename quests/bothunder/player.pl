sub EVENT_CLICKDOOR { 
my $gargoyle_check = $entity_list->GetMobByNpcTypeID(209024);
 if($doorid == 51 && (plugin::check_hasitem($client, 9433) && !defined $qglobals{agnarrkey}) || ($status > 79)) {
   quest::movepc(209,-765,-1735,1270);
   quest::setglobal("agnarrkey",1,3,"M5");
   }
 elsif($doorid == 51 && defined $qglobals{agnarrkey}) {
   quest::movepc(209,-765,-1735,1270);
   }
 elsif($doorid == 51 && !plugin::check_hasitem($client, 9433) && !defined $qglobals{agnarrkey}) {
   if ($gargoyle_check) {
      my $gargoyle = $gargoyle_check->CastToNPC();
      $gargoyle->AddToHateList($client, 1);
    }
  }
$qglobals{agnarrkey}=undef;
} 