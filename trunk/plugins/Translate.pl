# ===========================================================================
# MT-Translate: Translate phrases inside MT templates.
# A Plugin for Movable Type
#
# Release 1.0.0
# January 26, 2005
#
# http://jayseae.cxliv.org/
# http://www.amazon.com/o/registry/2Y29QET3Y472A/
#
# If you find the software useful or even like it, then a simple 'thank you'
# is always appreciated.  A reference back to me is even nicer.  If you find
# a way to make money from the software, do what you feel is right.
#
# Copyright 2005, Chad Everett (software@jayseae.cxliv.org)
# Licensed under the Open Software License version 2.1
# ===========================================================================
package MT::Plugin::Translate;

use vars qw($VERSION);
$VERSION = '1.0.0';

use strict;

use MT;
use MT::Template::Context;

if ($MT::VERSION =~ m(^3\.)) {
  use MT::Plugin;
  my $about = {
    name => 'MT-Translate '. $VERSION,
    description => 'Translate phrases inside MT templates.',
    doc_link => 'http://jayseae.cxliv.org/translate/'
  }; 
  MT->add_plugin(new MT::Plugin($about));
}

MT::Template::Context->add_tag(Translate => \&Translate);
MT::Template::Context->add_tag(TranslateLanguage => \&TranslateLanguage);

sub Translate {
  my ($ctx, $args) = @_;
  return '' unless ($args->{phrase});
  my $phrase = $args->{phrase};
  MT->translate($phrase);
}

sub TranslateLanguage {
  my ($ctx, $args) = @_;
  my $lang = $args->{language} || MT::ConfigMgr->instance->DefaultLanguage;
  MT->set_language($lang);
  '';
}

1;
