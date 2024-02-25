#!/usr/bin/pup
# Ensure correct versions of flask and werkzeug are installed
package { 'flask':
  ensure   => '2.0.1',
  provider => 'pip3',
}

package { 'werkzeug':
  ensure   => installed,
  provider => 'pip3',
}