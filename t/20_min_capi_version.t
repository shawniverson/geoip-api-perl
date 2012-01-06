# -*- Mode: Perl; -*-

use strict;
use Test;

$^W = 1;

BEGIN { plan tests => 1 }

use Geo::IP;
my $capi_version;
if ( Geo::IP->api eq 'CAPI' ) {
  eval { $capi_version = Geo::IP->lib_version };
}

unless ( defined $capi_version ) {

  # ugh, we use the pure perl API
  ok( 1, 1, "Pure perl API - skip" );
} else {
  ok( $capi_version, "1.5.0", "CAPI must be at least 1.5.0 - Please update libGeoIP" );
}
