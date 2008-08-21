# Astro::VO::VOEvent test harness

# strict
use strict;

#load test
use Test::More tests => 668;
use File::Spec;
use Data::Dumper;

# load modules
BEGIN {
   use_ok("Astro::VO::VOEvent");
}

# debugging
use Data::Dumper;

# T E S T   H A R N E S S --------------------------------------------------

# test the test system
ok(1);
 
my $dir = File::Spec->catdir( File::Spec->curdir(), "t", "voevent" );
                                
# NB: first 2 entries in a directory listing are '.' and '..'
my ( @files );
if ( opendir (DIR, $dir )) {
   pass( "Opened t/voevent/ directory" );
   foreach ( readdir DIR ) {
      push( @files, $_ ); 
   }
   closedir DIR;
} else {
   BAIL_OUT( "Can not open t/voevent/ directory" );
   exit;  
} 

# loop through all the files in the directory
foreach my $i ( 2 ... $#files ) {
   next if $files[$i] eq "CVS";

   my $file = File::Spec->catfile( $dir, $files[$i] );

   my $object;
   ok( $object = new Astro::VO::VOEvent( File => $file ), "Created object $i");
   
   #my $id = $object->id();
   #my $ra = $object->ra();
   #my $dec = $object->dec();
   #my $timeinstant = $object->timeinstant();
   #my $starttime = $object->starttime();
   #my $stoptime = $object->stoptime();
   #my $concept = $object->concept();
   #my $name = $object->name();
   #my $contactname = $object->contactname();
   #my $contactemail = $object->contactemail();
   #my $params = $object->params();
   #my $references = $object->references();
 
   print Dumper( $object );
}

exit;


# T I M E   A T   T H E   B A R ---------------------------------------------

exit;  
