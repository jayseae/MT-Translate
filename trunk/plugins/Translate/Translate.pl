# ===========================================================================
# A Movable Type plugin to translate phrases inside templates.
# Copyright 2005 Everitz Consulting <everitz.com>.
#
# This program is free software:  You may redistribute it and/or modify it
# it under the terms of the Artistic License version 2 as published by the
# Open Source Initiative.
#
# This program is distributed in the hope that it will be useful but does
# NOT INCLUDE ANY WARRANTY; Without even the implied warranty of FITNESS
# FOR A PARTICULAR PURPOSE.
#
# You should have received a copy of the Artistic License with this program.
# If not, see <http://www.opensource.org/licenses/artistic-license-2.0.php>.
# ===========================================================================
package MT::Plugin::Translate;

use vars qw($VERSION);
$VERSION = '1.0.1';

use strict;

use MT;
use MT::Template::Context;

if ($MT::VERSION =~ m(^3\.)) {
  use MT::Plugin;
  my $about = {
    name => 'MT-Translate '. $VERSION,
    description => 'Translate phrases inside templates.',
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
