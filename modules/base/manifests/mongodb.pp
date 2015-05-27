class base::mongodb {
  notice('Mongodb beeing installed.')

  file { "directory_srv" :
    name   => "/srv/",
    ensure => "directory",
    owner  => "root",
    group  => "www-data",
    mode   => 750,
  } ->

  exec { "download_configs":
    command => "git clone ${::gitconfigrepo} /srv/config/",
    path    => "/usr/local/bin/:/usr/bin/:/bin/",
    cwd     => "/srv/",
  } ->

  package { 'mongodb-server' :
    ensure => installed,
  } ->

  file { "mongodb_config":
    name => "/etc/mongodb.conf",
    notify  => Service["mongodb"],  # this sets up the relationship
    ensure => file,
    owner => root,
    group => root,
    mode  => 644,
    source => "/srv/config/${::etc_config}/mongodb.conf",
    require => Package["mongodb-server"],
  }

  # define the service to restart
  service { "mongodb":
    ensure  => "running",
    enable  => "true",
    require => Package["mongodb-server"],
  }

}
