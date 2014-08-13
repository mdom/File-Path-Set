use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
	module_name         => 'File::Path::Set',
	license             => 'perl',
	dist_author         => 'Mario Domgoergen <dom@math.uni-bonn.de>',
	dist_version_from   => 'lib/File/Path/Set.pm',
	create_readme       => 1,
	requires => {
		"File::Spec"  => 0,
		"Path::Class" => 0,
		"Moose"       => 0,
	},
	build_requires => {
		'Test::More'  => 0,
	},
);

$builder->create_build_script();
