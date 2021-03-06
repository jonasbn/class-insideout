use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "a safe, simple inside-out object construction kit",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Class-InsideOut",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.008",
  "NAME" => "Class::InsideOut",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Class::ISA" => 0,
    "Exporter" => 0,
    "Scalar::Util" => "1.09",
    "Storable" => 0,
    "overload" => 0,
    "strict" => 0,
    "vars" => 0
  },
  "TEST_REQUIRES" => {
    "DynaLoader" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "IO::File" => 0,
    "Test::More" => "0.45",
    "XSLoader" => 0,
    "lib" => 0,
    "threads" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.15",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Class::ISA" => 0,
  "DynaLoader" => 0,
  "Exporter" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "IO::File" => 0,
  "Scalar::Util" => "1.09",
  "Storable" => 0,
  "Test::More" => "0.45",
  "XSLoader" => 0,
  "lib" => 0,
  "overload" => 0,
  "strict" => 0,
  "threads" => 0,
  "vars" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
