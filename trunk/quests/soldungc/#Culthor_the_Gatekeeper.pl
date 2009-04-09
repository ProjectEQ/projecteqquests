my $liveguard = 0;

sub EVENT_AGGRO {
  my $guards = $entity_list->GetMobByNpcTypeID(278006);

  if ($guards) {
    my $guards = $guards->CastToNPC();
    $guards->AddToHateList($client, 1);
}
 }
 
sub EVENT_SIGNAL {
  
  if($signal == 80) { #when a guard spawns, add one.
   $liveguard += 1;
    if($liveguard < -5) {
      quest::modifynpcstat(max_hit,1700);
 }
    elsif($liveguard == -5) {
      quest::modifynpcstat(max_hit,1500);
 }
    elsif($liveguard == -4) {
      quest::modifynpcstat(max_hit,1300);
 }
    elsif($liveguard == -3) {
      quest::modifynpcstat(max_hit,1100);
 }
    elsif($liveguard == -2) {
      quest::modifynpcstat(max_hit,900);
 }
    elsif($liveguard == -1) {
      quest::modifynpcstat(max_hit,800);
 }
    elsif($liveguard > -1) {
      quest::modifynpcstat(max_hit,700);
 }
}
  if($signal == 81) { #when a guard dies, remove one.
   $liveguard -= 1;    
    if($liveguard < -5) {
      quest::modifynpcstat(max_hit,1700);
 }
    elsif($liveguard == -5) {
      quest::modifynpcstat(max_hit,1500);
 }
    elsif($liveguard == -4) {
      quest::modifynpcstat(max_hit,1300);
 }
    elsif($liveguard == -3) {
      quest::modifynpcstat(max_hit,1100);
 }
    elsif($liveguard == -2) {
      quest::modifynpcstat(max_hit,900);
 }
    elsif($liveguard == -1) {
      quest::modifynpcstat(max_hit,800);
 }
    elsif($liveguard > -1) {
      quest::modifynpcstat(max_hit,700);
  }
 }
}