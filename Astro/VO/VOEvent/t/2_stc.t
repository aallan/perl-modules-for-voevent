# Astro::VO::VOEvent test harness

# strict
use strict;

#load test
use Test::More tests => 73;

# load modules
BEGIN {
   use_ok("Astro::VO::VOEvent");
}

# debugging
use Data::Dumper;

# T E S T   H A R N E S S --------------------------------------------------

# test the test system
ok(1);

# read from data block
my @buffer = <DATA>;
chomp @buffer;        

my $object = new Astro::VO::VOEvent();

my $address = "Los Alamos National Laboratory,\n" .
              "PO Box 1663,\nISR-1, MS B244,\n" .
              "Los Alamos, NM 87545";
              
my $document = $object->build( 
     UseSTC => 1,
     Role => 'test',
     ID   => 'ivo://raptor.lanl/23456789/',
     Description => 'This is some human readable text.',
     Who => { Publisher => 'ivo://raptor.lanl',
                   Date => '2005-04-15T14:34:16',
                   Contact => { Name => 'Robert White',
                                Institution => 'LANL',
                                Address => $address,
                                Telephone => '+1-505-665-3025',
                                Email => 'rwhite@lanl.gov' } },
     Citations => [ { ID => 'ivo://raptor.lanl/98765432/', 
                      Cite => 'supercedes' },
                    { ID => 'ivo://estar.org/1234567/aa/', 
                      Cite => 'associated' } ],
     WhereWhen => { RA => '148.888', Dec => '69.065', Error => '4',
                    Time => '2005-04-15T23:59:59', TimeError => '30' },  
     How => { Name => 'Raptor AB', Location => 'Los Alamos',
              RTML => 'http://www.raptor.lanl.gov/documents/phase_zero.html' },
     What => [ { Group => [ { Name  => 'magnitude',
                              UCD   => 'phot.mag:em.opt.R',
                              Value => '13.2',
			      Units => 'mag' },
                            { Name  => 'error',
                              UCD   => 'phot.mag:stat.error',
                              Value => '0.1',
			      Units => 'mag' } ] },
               { Group => [ { Name  => 'magnitude',
                              UCD   => 'phot.mag:em.opt.V',
                              Value => '12.5',
			      Units => 'mag' },
                            { Name  => 'error',
                              UCD   => 'phot.mag:stat.error',
                              Value => '0.1',
			      Units => 'mag' } ] },
               { Name  => 'seeing',
                  UCD   => 'instr.obsty.site.seeing',
                  Value => '2',
                  Units => 'arcsec' },
               { Name  => 'misc',
                 UCD   => 'misc.junk',
                 Value => 'unknown' } ],
       Why  => [ {Inference => {  Relation     => 'associated',
                                 Name         => 'NGC1234',
                                 Concept      => 'Galaxy' }},
                 {Inference => {  Probability  => '0.3', 
                                 Concept => 'Fast Orphan Optical Transient' }},                    {Concept => 'Supernova'} ]
                                   
    );

print "\n\n$document\n\n";
                  
my @xml = split( /\n/, $document );
foreach my $i ( 0 ... $#buffer ) {
   is( $xml[$i], $buffer[$i], "comparing line $i in XML document" );
}

my $id = $object->id( );
is( $id, "ivo://raptor.lanl/23456789/", "comparing ID strings" );


# T I M E   A T   T H E   B A R ---------------------------------------------

exit;  

# D A T A   B L O C K --------------------------------------------------------

__DATA__
<?xml version="1.0" encoding="UTF-8"?>

<VOEvent role="test" ivorn="ivo://raptor.lanl/23456789/" version="1.1x" xmlns:stc="http://www.ivoa.net/xml/STC/stc-v1.20.xsd" xmlns:crd="http://www.ivoa.net/xml/STC/STCCoords/v1.20" xmlns:xi="http://www.w3c.org/2001/XInclude" xmlns:xsi="http://www.w3c.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.ivoa.net/xml/STC/stc-v1.20">
    <Description>This is some human readable text.</Description>
    <Who>
        <Publisher>ivo://raptor.lanl</Publisher>
        <Contact>
            <Name>Robert White</Name>
            <Institution>LANL</Institution>
            <Address>Los Alamos National Laboratory,
PO Box 1663,
ISR-1, MS B244,
Los Alamos, NM 87545</Address>
            <Telephone>+1-505-665-3025</Telephone>
            <Email>rwhite@lanl.gov</Email>
        </Contact>
        <Date>2005-04-15T14:34:16</Date>
    </Who>
    <Citations>
        <EventID cite="supercedes">ivo://raptor.lanl/98765432/</EventID>
        <EventID cite="associated">ivo://estar.org/1234567/aa/</EventID>
    </Citations>
    <WhereWhen>
        <stc:ObservationLocation>
            <crd:AstroCoords coord_system_id="FK5-UTC">
                <crd:Time unit="s">
                    <crd:TimeInstant>
                        <crd:TimeScale>UTC</crd:TimeScale>
                        <crd:ISOTime>2005-04-15T23:59:59</crd:ISOTime>
                    </crd:TimeInstant>
                </crd:Time>
                <crd:Position2D unit="deg">
                    <crd:Value2>148.888 69.065</crd:Value2>
                    <crd:Error1Circle>
                        <crd:Size>4</crd:Size>
                    </crd:Error1Circle>
                </crd:Position2D>
            </crd:AstroCoords>
        </stc:ObservationLocation>
    </WhereWhen>
    <How>
        <Instrument>
            <Name>Raptor AB</Name>
            <Location>Los Alamos</Location>
            <Reference uri="http://www.raptor.lanl.gov/documents/phase_zero.html" type="rtml" />
        </Instrument>
    </How>
    <What>
        <Group>
            <Param name="magnitude" ucd="phot.mag:em.opt.R" value="13.2" units="mag" />
            <Param name="error" ucd="phot.mag:stat.error" value="0.1" units="mag" />
        </Group>
        <Group>
            <Param name="magnitude" ucd="phot.mag:em.opt.V" value="12.5" units="mag" />
            <Param name="error" ucd="phot.mag:stat.error" value="0.1" units="mag" />
        </Group>
        <Param name="seeing" ucd="instr.obsty.site.seeing" value="2" units="arcsec" />
        <Param name="misc" ucd="misc.junk" value="unknown" />
    </What>
    <Why>
        <Inference relation="associated">
            <Concept>Galaxy</Concept>
            <Name>NGC1234</Name>
        </Inference>
        <Inference probability="0.3">
            <Concept>Fast Orphan Optical Transient</Concept>
        </Inference>
        <Concept>Supernova</Concept>
    </Why>
</VOEvent>