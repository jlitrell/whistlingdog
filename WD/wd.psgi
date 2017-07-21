use strict;
use warnings;

use WD;

my $app = WD->apply_default_middlewares(WD->psgi_app);
$app;

