package Data::Transmute::Rules::TreeNodeHash::StringifyChildren;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

our @RULES = (
    [transmute_nodes => {
        recurse_object => 1,
        rules => [
            [create_hash_key => {
                name => 'children',
                replace => 1,
                value_code => sub { ref $_[0] ? "$_[0]" : $_[0] },
            }],
        ],
    }],
);

1;
# ABSTRACT: Stringify children attributes in tree nodes to make the tree more dump-friendly

=head1 DESCRIPTION

Tree is an interlinked data structure, where parent links to children and the
children link back to their parents. This makes the dump of a tree node
unwieldy; if you dump a node, you will end up dumping the whole tree.

This rule walks the tree structure and replaces the value of hash key 'children'
to its stringified value. This effectively "clips" the children when dumping,
which is sometimes desirable when debugging.


=head1 SEE ALSO

L<Data::Transmute::Rules::TreeNodeHash::StringifyParent>
