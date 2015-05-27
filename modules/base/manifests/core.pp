class base::core {
    notice('Core beeing installed.')

    package { 'dstat' :
        ensure => installed
    }
    package { 'g++' :
        ensure => installed
    }
    package { 'make' :
        ensure => installed
    }
    package { 'emacs' :
        ensure => installed
    }
    package { 'ncftp' :
        ensure => installed
    }
    package { 'fail2ban' :
        ensure => installed
    }
    package { 'logwatch' :
        ensure => installed
    }
    package { 'zip' :
        ensure => installed
    }


}
