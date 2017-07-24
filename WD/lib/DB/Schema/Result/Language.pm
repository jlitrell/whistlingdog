use utf8;
package DB::Schema::Result::Language;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Language

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<language>

=cut

__PACKAGE__->table("language");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 key_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 en

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "key_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "en",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=item * L</key_name>

=back

=cut

__PACKAGE__->set_primary_key("id", "key_name");

=head1 UNIQUE CONSTRAINTS

=head2 C<Key_name_UNIQUE>

=over 4

=item * L</key_name>

=back

=cut

__PACKAGE__->add_unique_constraint("Key_name_UNIQUE", ["key_name"]);

=head2 C<id_UNIQUE>

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->add_unique_constraint("id_UNIQUE", ["id"]);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-07-23 19:29:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YCHCiLCMbsB1BJklB6f2Yg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
