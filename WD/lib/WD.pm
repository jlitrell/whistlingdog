package WD;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
-Debug
/;

extends 'Catalyst';

our $VERSION = '0.01';


__PACKAGE__->config(
    name => 'WD',
    default_view => 'Web',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
    encoding => 'UTF-8',
    'View::Web' => {
        INCLUDE_PATH => [
            __PACKAGE__->path_to('root', 'src'),
            __PACKAGE__->path_to('root', 'lib')
        ],
    },
);

__PACKAGE__->setup();


1;
