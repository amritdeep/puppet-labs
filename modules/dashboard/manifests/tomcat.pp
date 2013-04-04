class dashboard::tomcat {

  package { "tomcat7": 
    ensure => present,
    require => Package["openjdk-7-jdk"],
  }

  service { "tomcat7": 
    ensure => running 
  }

  file {"tomcat-users":
    path    => "/etc/tomcat7/conf/tomcat-users.xml",
    ensure  => present,
    mode    => 0644,
    source  => "puppet:///modules/dashboard/static/tomcat-users",
    owner   => "root",
    group   => "tomcat7",
    require => Package["tomcat7"],
    notify =>  Service["tomcat7"],
  }

}