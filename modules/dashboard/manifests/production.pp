class dashboard::production {

  include dashboard::nginx
  include dashboard::tomcat
  include dashboard::postgresql

  user { "www":
    comment => "Dashboad User",
    home    => "/home/www",
    ensure  => present,
    gid     => "www-data",
    shell   => "/bin/bash",
    managehome   => true,
  }

  file { "home":
    path    => "/home/www",
    ensure  =>  directory,
    owner   => "www",
    group   => "www-data",
    require => User["www"],
  }

  file { "app":
    path    => "/home/www/app",
    ensure  =>  directory,
    owner   => "www",
    group   => "www-data",
    require => File["home"],
  }

  package { "openjdk-7-jdk": 
    ensure  => present 
  }

}
