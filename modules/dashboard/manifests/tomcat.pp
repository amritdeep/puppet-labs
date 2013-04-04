class dashboard::tomcat {

  package { "tomcat7": 
    ensure => present,
    require => Package["openjdk-7-jdk"],
  }

  package { "tomcat7-admin": 
    ensure => present,
    require => Package["tomcat7"],
  }

  exec { "purge-root":
    command => "rm -rf /var/lib/tomcat7/webapps/*",
    before  => Service["tomcat7"], 
  }

  service { "tomcat7": 
    ensure => running,
    require => Package["tomcat7"],
  }

  file {"tomcat-users":
    path    => "/etc/tomcat7/tomcat-users.xml",
    ensure  => present,
    mode    => 0644,
    source  => "puppet:///modules/dashboard/static/tomcat-users",
    owner   => "root",
    group   => "tomcat7",
    require => Package["tomcat7"],
    notify =>  Service["tomcat7"],
  }

}