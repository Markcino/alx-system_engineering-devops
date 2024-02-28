#!/usr/bin/env bash
#Install nginx web server

exec { 'update':
  command => '/usr/bin/apt-get update',
  path    => ['/usr/bin', '/usr/sbin'],
}

package { 'nginx':
  ensure  => installed,
  require => Exec['update'],
}

file_line { 'aaaaa':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  require => Package['nginx'],
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
