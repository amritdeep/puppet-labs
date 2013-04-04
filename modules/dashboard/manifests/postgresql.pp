class dashboard::postgresql {

  package { "postgresql-9.1": 
    ensure => present 
  }

  package { "postgresql-client-9.1": 
    ensure => present 
  }

  service { "postgresql": 
    ensure => running,
    require => Package["postgresql-9.1", "postgresql-client-9.1"],
  }

}