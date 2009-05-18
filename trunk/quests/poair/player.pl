sub EVENT_CLICKDOOR { 
my $gargoyle_check = $entity_list->GetMobByNpcTypeID(209024);
 if($doorid == 1 && plugin::check_hasitem($client, 28638) && !defined $qglobals{Xegkey}) {
   quest::movepc(209,-765,-1735,1270);
   quest::setglobal("Xegkey",1,3,"M5");
   }
 elsif($doorid == 1 && defined $qglobals{Xegkey}) {
   quest::movepc(209,-765,-1735,1270);
   }

$qglobals{Xegkey}=undef;
} 