#This charm gains power the closer it is until midnight.

my %scale = (
  0 => 13,
  1 => 12,
  2 => 11,
  3 => 10,
  4 => 9,
  5 => 8,
  6 => 7,
  7 => 6,
  8 => 5,
  9 => 4,
 10 => 3,
 11 => 2,
 12 => 1,
 13 => 2,
 14 => 3,
 15 => 4,
 16 => 5,
 17 => 6,
 18 => 7,
 19 => 8,
 20 => 9,
 21 => 10,
 22 => 11,
 23 => 12
);

sub EVENT_SCALE_CALC {
  $questitem->SetScale($scale{$zonehour}/8);
}