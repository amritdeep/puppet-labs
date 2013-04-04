class dashboard::production {

  include dashboard::nginx
  include dashboard::tomcat
  include dashboard::postgresql

  user { "www":
    comment => "Dashboad User",
    home => "/home/www",
    ensure => present,
    shell => "/bin/bash",
  }

  package { "openjdk-7-jdk": 
    ensure => present 
  }

}
