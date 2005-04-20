# <@LICENSE>
# Copyright 2004 Apache Software Foundation
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# </@LICENSE>

package Mail::SpamAssassin::BayesStore::SDBM;

use strict;
use warnings;
use bytes;
use Fcntl;

use Mail::SpamAssassin::BayesStore::DBM;
use Mail::SpamAssassin::Logger;

use vars qw{ @ISA @DBNAMES };

@ISA = qw( Mail::SpamAssassin::BayesStore::DBM );

sub HAS_DBM_MODULE {
  my ($self) = @_;
  if (exists($self->{has_dbm_module})) {
    return $self->{has_dbm_module};
  }
  $self->{has_dbm_module} = eval { require SDBM_File; };
}

sub DBM_MODULE {
  return "SDBM_File";
}

# Possible file extensions used by the kinds of database files SDBM_File
# might create.  We need these so we can create a new file and rename
# it into place.
sub DB_EXTENSIONS {
  return ('.pag', '.dir');
}

# this is called directly from sa-learn(1).
sub perform_upgrade {

  return 1;
}


1;
