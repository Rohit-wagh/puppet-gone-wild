class base_setup {
  # Declare a file resource to manage a configuration file
  file { '/etc/motd':
    ensure  => file,
    content => "Welcome to your Puppet-managed system!\n",
    mode    => '0644',
  }

  # Manage a user account
  user { 'devops':
    ensure     => present,
    managehome => true,
    home       => '/home/devops',
    shell      => '/bin/bash',
  }

  # Manage an SSH key for the 'devops' user
  file { '/home/devops/.ssh':
    ensure => directory,
    owner  => 'devops',
    group  => 'devops',
    mode   => '0700',
  }
  # Ensure apt-get update runs before installing packages
  exec { 'apt_update':
    command     => '/usr/bin/apt-get update',
    path        => ['/bin', '/usr/bin'],
    refreshonly => true,  # Runs only when triggered by fix_apt_sources
  }

  # Install required packages (ensuring apt_update runs first)
  package { ['nginx', 'vim', 'git', 'curl', 'cron']:
    ensure  => installed,
    require => Exec['apt_update'],  # Ensures apt-get update runs first
  }

  # Ensure web root directory exists
  file { '/var/www/html':
    ensure => directory,
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0755',
  }

  # Create a simple index.html file
  file { '/var/www/html/index.html':
    ensure  => present,
    content => '<h1>Welcome to Nginx</h1>',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    require => File['/var/www/html'],
  }

  # Ensure cron service is running
  service { 'cron':
    ensure  => running,
    enable  => true,
    require => Package['cron'],
  }

  # Ensure nginx is running
  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
  }

  # Ensure Puppet agent cronjob
  cron { 'puppet_agent_run':
  ensure  => present,
  command => '/opt/puppetlabs/bin/puppet agent --onetime --no-daemonize --splay --quiet',
  user    => 'root',
  minute  => '*/10',
}

}

include base_setup

