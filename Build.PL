use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
	module_name         => 'File::Path::Set',
	license             => 'perl',
	dist_author         => 'Mario Domgoergen <mario@domgoergen.com>',
	dist_version_from   => 'lib/File/Path/Set.pm',
	create_readme       => 1,
	requires => {
		"Path::Tiny" => 0,
		"Moo"        => 0,
	},
	build_requires => {
		'Test::More'  => 0,
	},
);

$builder->create_build_script();
