class dashboard::tomcat {

  package { "tomcat7": 
    ensure => present 
  }

  service { "tomcat7": 
    ensure => running 
  }

  file {"tomcat-users":
    path    => "/var/lib/tomcat7/conf/tomcat-users.xml",
    ensure  => present,
    mode    => 0640,
    source  => "puppet:///modules/dashboard/static/tomcat-users",
    owner   => "root",
    group   => "tomcat7",
    require => Package["tomcat7"],
  }

  notify {"just a test":}

}