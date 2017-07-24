package WD::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'DB::Schema',

    connect_info => {
        dsn => 'dbi:mysql:whistlingdog:db.whistlingdog.com',
        user => 'whistlingdog',
        password => 'tVddqU2GVxkuXw2Q',
        mysql_enable_utf8 => 1,
    }
);


1;
