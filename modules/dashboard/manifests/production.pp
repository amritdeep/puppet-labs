class dashboard::production {

  include dashboard::nginx
  include dashboard::java
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
    path    => "/home/www/app/dashboard",
    ensure  =>  directory,
    owner   => "www",
    group   => "www-data",
    recurse => true,
    require => File["home"],
  }

}
