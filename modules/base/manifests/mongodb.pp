class base::mongodb {
  notice('Mongodb beeing installed.')

  package { 'mongodb-org' :
    ensure => installed,
  }

  # define the service to restart
  service { "mongod":
    ensure  => "running",
    enable  => "true",
    require => Package["mongodb-org"],
  }

}
