file { '/tmp/testfile':
  ensure  => present,
  content => "Hello from Puppet!",
}

