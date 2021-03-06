# Astro::VO::VOEvent test harness

# strict
use strict;

#load test
use Test::More tests => 8;

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

my $xml = "";
foreach my $i ( 0 ... $#buffer ) {
   $xml = $xml . $buffer[$i];
}   

my $object = new Astro::VO::VOEvent( XML => $xml );

my $id = $object->id( );
is( $id, "ivo://nasa.gsfc.gcn/GLAST#LAT_Test_Pos_2008-08-21T08:43:11.00_099999-0-206", "comparing ID strings" );

my $role = $object->role( );
is( $role, "test", "comparing ROLE strings" );

my $version = $object->version( );
is( $version, "1.1", "comparing VERSION strings" );

my $description = $object->description( );
is( $description, "GLAST Satellite, LAT Instrument", "comparing <Description>" );

my $ra = $object->ra( );
is( $ra, "180.0000", "Comparing RA" );

my $dec = $object->dec( );
is( $dec, "35.0000", "Comparing Dec" );

#print Dumper( $object );

# T I M E   A T   T H E   B A R ---------------------------------------------

exit;  

# D A T A   B L O C K --------------------------------------------------------

__DATA__
<?xml version="1.0" encoding="UTF-8"?>
<voe:VOEvent xmlns:voe="http://www.ivoa.net/xml/VOEvent/v1.1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" ivorn="ivo://nasa.gsfc.gcn/GLAST#LAT_Test_Pos_2008-08-21T08:43:11.00_099999-0-206" role="test" version="1.1" xsi:schemaLocation="http://www.ivoa.net/xml/VOEvent/v1.1 http://www.ivoa.net/xml/VOEvent/VOEvent-v1.1.xsd">
  <Who>
    <AuthorIVORN>ivo://nasa.gsfc.tan/gcn</AuthorIVORN>
    <Author>
      <shortName>GLAST (via VO-GCN)</shortName>
      <contactName>Steve Ritz</contactName>
      <contactPhone>+1-301-286-0941</contactPhone>
      <contactEmail>steven.m.ritz@nasa.gov</contactEmail>
    </Author>
    <Date>2008-08-21T08:43:19</Date>
    <Description>This VOEvent message was created with GCN version: 10.18.9  20 AUG 08</Description>
  </Who>
  <What>
    <Param name="Packet_Type" value="124" />
    <Param name="Pkt_Ser_Num" value="6" />
    <Param name="TrigID" value="99999" ucd="meta.id" />
    <Param name="Burst_TJD" value="14699" unit="days" ucd="time" />
    <Param name="Burst_SOD" value="31391.00" unit="sec" ucd="time" />
    <Param name="Burst_Inten" value="20" unit="cts" ucd="phot.count" />
    <Param name="Integ_Time" value="0.256" unit="sec" ucd="time.intrval" />
    <Param name="Trigger_ID" value="0x1" />
    <Param name="Misc_flags" value="0x40000000" />
    <Group name="Trigger_ID">
      <Param name="Point_Source" value="true" />
      <Param name="GRB_Identified" value="false" />
      <Param name="Def_NOT_a_GRB" value="false" />
      <Param name="Target_in_Flt_Catalog" value="false" />
      <Param name="Target_in_Gnd_Catalog" value="false" />
      <Param name="Target_in_Blk_Catalog" value="false" />
      <Param name="Test_Submission" value="false" />
    </Group>
    <Group name="Misc_Flags">
      <Param name="Values_Out_of_Range" value="false" />
      <Param name="Near_Bright_Star" value="false" />
      <Param name="Err_Circle_in_Galaxy" value="false" />
      <Param name="Galaxy_in_Err_Circle" value="false" />
      <Param name="TOO_Generated" value="false" />
      <Param name="Trig_time_is_SecHdrTime" value="false" />
      <Param name="Delayed_Transmission" value="false" />
      <Param name="Updated_Notice" value="false" />
      <Param name="Flt_Generated" value="false" />
      <Param name="Gnd_Generated" value="true" />
      <Param name="CRC_Error" value="false" />
    </Group>
    <Group name="Obs_Support_Info">
      <Description>The Sun and Moon values are valid at the time the VOEvent XML message was created.</Description>
      <Param name="Sun_RA" value="150.81" unit="deg" ucd="pos.eq.ra" />
      <Param name="Sun_Dec" value="11.94" unit="deg" ucd="pos.eq.dec" />
      <Param name="Sun_Distance" value="35.13" unit="deg" ucd="pos.angDistance" />
      <Param name="Sun_Hr_Angle" value="-1.95" unit="hr" />
      <Param name="Moon_RA" value="20.68" unit="deg" ucd="pos.eq.ra" />
      <Param name="Moon_Dec" value="13.88" unit="deg" ucd="pos.eq.dec" />
      <Param name="MOON_Distance" value="127.41" unit="deg" ucd="pos.angDistance" />
      <Param name="Moon_Illum" value="78.24" unit="%" ucd="arith.ratio" />
      <Param name="Galactic_Long" value="174.18" unit="deg" ucd="pos.galactic.lon" />
      <Param name="Galactic_Lat" value="76.48" unit="deg" ucd="pos.galactic.lat" />
      <Param name="Ecliptic_Long" value="164.44" unit="deg" ucd="pos.ecliptic.lon" />
      <Param name="Ecliptic_Lat" value="31.75" unit="deg" ucd="pos.ecliptic.lat" />
    </Group>
  </What>
  <WhereWhen>
    <ObsDataLocation xmlns="http://www.ivoa.net/xml/STC/stc-v1.30.xsd">
      <ObservatoryLocation xlink:href="ivo://STClib/Observatories#GEOLUN/" xlink:type="simple" id="GEOLUN" />
      <ObservationLocation>
        <AstroCoordSystem xlink:href="ivo://STClib/CoordSys#UTC-FK5-GEO/" xlink:type="simple" id="FK5-UTC-GEO" />
        <AstroCoords coord_system_id="FK5-UTC-GEO">
          <Time unit="s">
            <TimeInstant>
              <ISOTime>2008-08-21T08:43:11.00</ISOTime>
            </TimeInstant>
          </Time>
          <Position2D unit="deg">
            <Name1>RA</Name1>
            <Name2>Dec</Name2>
            <Value2>
              <C1 pos_unit="deg">180.0000</C1>
              <C2 pos_unit="deg">35.0000</C2>
            </Value2>
            <Error2Radius>0.4166</Error2Radius>
          </Position2D>
        </AstroCoords>
      </ObservationLocation>
    </ObsDataLocation>
  </WhereWhen>
  <How>
    <Description>GLAST Satellite, LAT Instrument</Description>
    <Reference uri="http://gcn.gsfc.nasa.gov/glast.html" type="url" />
  </How>
  <Why importance="0.95">
    <Inference probability="0.9">
      <Concept>process.variation.burst;em.gamma</Concept>
    </Inference>
  </Why>
  <Description />
</voe:VOEvent>
